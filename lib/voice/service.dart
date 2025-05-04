import 'dart:async';

import 'package:konfa/voice/recorder.dart';
import 'package:konfa/voice/listener.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';

import 'package:isolate_generator_annotation/isolate_generator_annotation.dart';

// part 'connection.g.dart';

const sampleRate = 48000;

// class _VoiceConnectionInitData {
//   SendPort sendPort;
//   late RootIsolateToken rootIsolateToken;

//   _VoiceConnectionInitData(this.sendPort) {
//     rootIsolateToken = RootIsolateToken.instance!;
//   }
// }

// class VoiceConnection {
//   final SendPort _isolateSendPort;
//   final ReceivePort _isolateReceivePort;
//   final Isolate _isolate;

//   VoiceConnection._(this._isolate, this._isolateSendPort, this._isolateReceivePort);

//   static Future<VoiceConnection> open() async {
//     final isolateReceivePort = ReceivePort();

//     final initData = _VoiceConnectionInitData(isolateReceivePort.sendPort);

//     final isolate = await Isolate.spawn<_VoiceConnectionInitData>(_isolateEntry, initData);

//     final portReceiver = Completer<SendPort>();

//     isolateReceivePort.listen((event) {
//       if (event is SendPort) {
//         portReceiver.complete(event);
//       }
//     });

//     final isolateSendPort = await portReceiver.future;

//     return VoiceConnection._(isolate, isolateSendPort, isolateReceivePort);
//   }

//   void close() {
//     _isolate.kill();
//   }

//   void listenToUser(String serverId, String channelId, String userId) {
//     _isolateSendPort.send(_ListenToUser(serverId, channelId, userId));
//   }

//   void speakToChannel(String serverId, String channelId, String userId) {
//     _isolateSendPort.send(_SpeakToChannel(serverId, channelId, userId));
//   }
// }

// sealed class _ConnectionCommand {}

// class _ListenToUser extends _ConnectionCommand {
//   final String serverId;
//   final String channelId;
//   final String userId;

//   _ListenToUser(this.serverId, this.channelId, this.userId);
// }

// class _SpeakToChannel extends _ConnectionCommand {
//   final String serverId;
//   final String channelId;
//   final String userId;

//   _SpeakToChannel(this.serverId, this.channelId, this.userId);
// }

// class _JoinChannel extends _ConnectionCommand {
//   final String serverId;
//   final String channelId;
//   final String userId;

//   _JoinChannel(this.serverId, this.channelId, this.userId);
// }

// class _LeaveChannel extends _ConnectionCommand {
//   final String serverId;
//   final String channelId;
//   final String userId;

//   _LeaveChannel(this.serverId, this.channelId, this.userId);
// }

// void _isolateEntry(_VoiceConnectionInitData data) async {
//   final logFile = File('voice_log.txt').openWrite();

//   l.capture(
//     () => runZonedGuarded(() => _startConnection(data), l.e),
//     LogOptions(
//       handlePrint: true, // Whether to handle `print()` calls.
//       outputInRelease: true, // Whether to output in release mode.
//       printColors: true, // Whether to print colors in the console.
//       output: LogOutput.platform, // Whether to use `print()` for output.
//       overrideOutput: (event) {
//         final msg = event.toString();
//         logFile.writeln(msg);
//         logFile.flush();
//         return msg;
//       },
//     ),
//   );
// }

// Future<void> _startConnection(_VoiceConnectionInitData data) async {
//   await initOpus();

//   BackgroundIsolateBinaryMessenger.ensureInitialized(data.rootIsolateToken);

//   final sendPort = data.sendPort;
//   ReceivePort receivePort = ReceivePort();
//   sendPort.send(receivePort.sendPort);

//   return _ConnectionIsolate(sendPort, receivePort).listen();
// }

// class _ConnectionIsolate {
//   final SendPort sendPort;
//   final ReceivePort receivePort;

//   late final VoiceServiceClient voiceServiceClient;

//   _ConnectionIsolate(this.sendPort, this.receivePort) {
//     final channel = grpc.ClientChannel(
//       serverAddress,
//       port: voiceServerPort,
//       options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
//     );

//     voiceServiceClient = VoiceServiceClient(channel);
//   }

//   Future<void> listen() async {
//     await for (final _ConnectionCommand message in receivePort) {
//       switch (message) {
//         case _ListenToUser message:
//           _listenToUser(message);
//         case _SpeakToChannel message:
//           _speakToChannel(message);
//       }
//     }
//   }

//   Future<void> _listenToUser(_ListenToUser message) async {
//     final speaker = VoiceChatSpeaker(
//       voiceServiceClient,
//       message.serverId,
//       message.channelId,
//       message.userId,
//     );
//     speaker.listen();
//   }

//   Future<void> _speakToChannel(_SpeakToChannel message) async {
//     final recorder = VoiceChatRecorder(
//       voiceServiceClient,
//       message.serverId,
//       message.channelId,
//       message.userId,
//     );
//     recorder.record();
//   }
// }

class VoiceService {
  late final VoiceServiceClient _voiceServiceClient;
  final String selfUserID;

  String? _joinedChannelID;
  // VoiceChatRecorder? _recorder;
  // Map<String, VoiceChatListener> _listeners = {};

  VoiceService(this._voiceServiceClient, this.selfUserID);

  Stream<UsersState> joinChannel(String serverID, String channelID) async* {
    if (_joinedChannelID != null) {
      await leaveChannel();
    }

    final respStream = _voiceServiceClient.joinChannel(
      JoinChannelRequest(serverId: serverID, channelId: channelID, userId: selfUserID),
    );

    final recorder = VoiceChatRecorder(_voiceServiceClient, serverID, channelID, selfUserID);
    await recorder.record();

    final listeners = <String, VoiceChatListener>{};

    await for (final resp in respStream) {
      if (resp.hasUsersState()) {
        for (final user in resp.usersState.userIds) {
          if (!listeners.containsKey(user)) {
            final listener = VoiceChatListener(_voiceServiceClient, serverID, channelID, user);
            await listener.listen();
            listeners[user] = listener;
          }
        }

        yield resp.usersState;
      }
    }

    recorder.stop();
    listeners.forEach((_, listener) => listener.stop());
  }

  Future<void> leaveChannel() async {
    if (_joinedChannelID == null) {
      return;
    }

    await Future.wait([
      VoiceChatListener(_voiceServiceClient, '', '', '').stop(),
      VoiceChatRecorder(_voiceServiceClient, '', '', '').stop(),
    ]);

    _joinedChannelID = null;
  }
}
