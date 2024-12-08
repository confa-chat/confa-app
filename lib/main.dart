import 'dart:io';

import 'package:flutter/material.dart';

import 'package:grpc/grpc.dart' as grpc;
import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';
import 'package:konfa/voice/connection.dart';
import 'package:konfa/voice/globals.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final serverId = 'konfach';
  final channelId = 'test';
  final userId = TextEditingController(text: "test");

  final Future<Connection> _connection = Connection.open();
  late VoiceServiceClient _voiceServiceClient;

  @override
  void initState() {
    final channel = grpc.ClientChannel(
      serverAddress,
      port: serverPort,
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
    );

    _voiceServiceClient = VoiceServiceClient(channel);

    super.initState();
  }

  void _join(List<String> users) async {
    if (Platform.isAndroid || Platform.isIOS || Platform.isWindows) {
      final status = await Permission.microphone.status;
      if (status.isDenied) {
        return;
      }

      final mic = await Permission.microphone.request();
      if (mic.isDenied) {
        return;
      }
    }

    for (var listenUserId in users) {
      if (listenUserId == userId.text) {
        continue;
      }

      (await _connection).listenToUser(serverId, channelId, listenUserId);
    }

    (await _connection).speakToChannel(serverId, channelId, userId.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 100, child: Text("Username")),
                  Expanded(
                    child: TextField(
                      controller: userId,
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                stream: _voiceServiceClient.subscribeChannelState(
                  SubscribeChannelStateRequest(
                    serverId: serverId,
                    channelId: channelId,
                  ),
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final state = snapshot.data as SubscribeChannelStateResponse;
                  return Column(
                    children: [
                      Column(children: state.users.map((e) => Text(e)).toList()),
                      ElevatedButton(
                        child: const Text('Join'),
                        onPressed: () => _join(state.users),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
