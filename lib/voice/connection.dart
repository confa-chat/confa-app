import 'dart:async';
import 'dart:isolate';

import 'package:grpc/grpc.dart' as grpc;
import 'package:konfa/voice/globals.dart';
import 'package:konfa/voice/recorder.dart';
import 'package:konfa/voice/speaker.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';
import 'package:konfa/voice/opus/opus.dart' as opus_init;

const sampleRate = 48000;

class Connection {
  final SendPort _isolateSendPort;
  final ReceivePort _isolateReceivePort;
  final Isolate _isolate;

  Connection._(this._isolate, this._isolateSendPort, this._isolateReceivePort);

  static Future<Connection> open() async {
    final isolateReceivePort = ReceivePort();

    final isolate = await Isolate.spawn(_isolateEntry, isolateReceivePort.sendPort);

    final portReceiver = Completer<SendPort>();

    isolateReceivePort.listen((event) {
      if (event is SendPort) {
        portReceiver.complete(event);
      }
    });

    final isolateSendPort = await portReceiver.future;

    return Connection._(isolate, isolateSendPort, isolateReceivePort);
  }

  void close() {
    _isolate.kill();
  }

  void listenToUser(String serverId, String channelId, String userId) {
    _isolateSendPort.send(_ListenToUser(serverId, channelId, userId));
  }

  void speakToChannel(String serverId, String channelId, String userId) {
    _isolateSendPort.send(_SpeakToChannek(serverId, channelId, userId));
  }
}

sealed class _ConnectionCommand {}

class _ListenToUser extends _ConnectionCommand {
  final String serverId;
  final String channelId;
  final String userId;

  _ListenToUser(this.serverId, this.channelId, this.userId);
}

class _SpeakToChannek extends _ConnectionCommand {
  final String serverId;
  final String channelId;
  final String userId;

  _SpeakToChannek(this.serverId, this.channelId, this.userId);
}

void _isolateEntry(SendPort sendPort) async {
  ReceivePort receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  opus_init.setupOpus();

  // minisound_ffi.MinisoundFfi.registerWith();

  final channel = grpc.ClientChannel(
    serverAddress,
    port: serverPort,
    options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
  );

  final _voiceServiceClient = VoiceServiceClient(channel);

  await for (final event in receivePort) {
    final message = event as _ConnectionCommand;

    switch (message) {
      case _ListenToUser():
        {
          final speaker = VoiceChatSpeaker(
            _voiceServiceClient,
            message.serverId,
            message.channelId,
            message.userId,
          );
          speaker.listen();
        }
      case _SpeakToChannek():
        {
          final recorder = VoiceChatRecorder(
            _voiceServiceClient,
            message.serverId,
            message.channelId,
            message.userId,
          );
          recorder.record();
        }
    }
  }
}
