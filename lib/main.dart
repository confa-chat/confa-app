import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:grpc/grpc.dart' as grpc;
import 'package:konfa/gen/proto/konfa/channel/v1/channels.pb.dart';
import 'package:konfa/gen/proto/konfa/chat/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';
import 'package:konfa/server/server.dart';
import 'package:konfa/theme.dart';
import 'package:konfa/voice/connection.dart';
import 'package:konfa/globals.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:l/l.dart';
import 'package:provider/provider.dart';

void main([List<String>? args]) {
  final logFile = File('log.txt').openWrite();

  l.capture<void>(
    () => runZonedGuarded<void>(
      () => runApp(const MyApp()),
      l.e,
    ),
    LogOptions(
      handlePrint: true,
      outputInRelease: true,
      printColors: true,
      output: LogOutput.ignore,
      overrideOutput: (event) {
        final msg = event.toString();
        logFile.writeln(msg);
        logFile.flush();
        return msg;
      },
    ),
  );

  // logFile.close();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userId = TextEditingController(text: "test");

  // final Future<VoiceConnection> _connection = VoiceConnection.open();
  // late VoiceServiceClient _voiceServiceClient;

  // @override
  // void initState() {
  //   final channel = grpc.ClientChannel(
  //     serverAddress,
  //     port: serverPort,
  //     options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
  //   );

  //   _voiceServiceClient = VoiceServiceClient(channel);

  //   super.initState();
  // }

  // void _join(List<String> users) async {
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     final status = await Permission.microphone.status;
  //     if (status.isDenied) {
  //       return;
  //     }

  //     final mic = await Permission.microphone.request();
  //     if (mic.isDenied) {
  //       return;
  //     }
  //   }

  //   for (var listenUserId in users) {
  //     // if (listenUserId == userId.text) {
  //     //   continue;
  //     // }

  //     (await _connection).listenToUser(serverId, channelId, listenUserId);
  //   }

  //   (await _connection).speakToChannel(serverId, channelId, userId.text);
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: KonfaTheme(
        child: Scaffold(
          body: SafeArea(
            child: ConnectScreen(
              child: ServerScreen(serverID: konfachServerID),
              // child: Column(
              //   children: [
              //     Row(
              //       children: [
              //         const SizedBox(width: 100, child: Text("Username")),
              //         Expanded(
              //           child: TextField(
              //             controller: userId,
              //           ),
              //         ),
              //       ],
              //     ),
              //     StreamBuilder(
              //       stream: _voiceServiceClient.subscribeChannelState(
              //         SubscribeChannelStateRequest(
              //           serverId: serverId,
              //           channelId: channelId,
              //         ),
              //       ),
              //       builder: (context, snapshot) {
              //         if (!snapshot.hasData) {
              //           return const CircularProgressIndicator();
              //         }
              //         final state = snapshot.data as SubscribeChannelStateResponse;
              //         return Column(
              //           children: [
              //             Column(children: state.users.map((e) => Text(e)).toList()),
              //             ElevatedButton(
              //               child: const Text('Join'),
              //               onPressed: () => _join(state.users),
              //             ),
              //           ],
              //         );
              //       },
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

class ConnectScreen extends StatefulWidget {
  final Widget child;

  const ConnectScreen({super.key, required this.child});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  late ServerServiceClient _serverClient;
  late ChatServiceClient _chatClient;

  @override
  void initState() {
    final channel = grpc.ClientChannel(
      serverAddress,
      port: 38100,
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
    );

    _serverClient = ServerServiceClient(channel);
    _chatClient = ChatServiceClient(channel);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ServerServiceClient>.value(
      value: _serverClient,
      child: Provider<ChatServiceClient>.value(
        value: _chatClient,
        child: widget.child,
      ),
    );
  }
}
