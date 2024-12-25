import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:grpc/grpc.dart' as grpc;
import 'package:konfa/auth/auth.dart';
import 'package:konfa/gen/proto/konfa/channel/v1/channels.pb.dart';
import 'package:konfa/gen/proto/konfa/chat/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';
import 'package:konfa/widgets/server.dart';
import 'package:konfa/theme.dart';
import 'package:konfa/voice/connection.dart';
import 'package:konfa/globals.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:l/l.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
      output: LogOutput.platform,
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
    return ChangeNotifierProvider.value(
      value: AuthState(),
      child: MaterialApp(
        home: KonfaTheme(
          child: Scaffold(
            body: SafeArea(
              child: Consumer<AuthState>(
                builder: (context, authState, _) {
                  if (authState.credential == null) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: () => authState.authenticate(),
                        child: const Text('Login'),
                      ),
                    );
                  }

                  return const ConnectScreen(
                    child: ServerScreen(serverID: konfachServerID),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

class ConnectScreen extends StatefulWidget {
  final Widget child;

  const ConnectScreen({super.key, required this.child});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  Future<List<SingleChildWidget>> _getConnections() async {
    final credential = Provider.of<AuthState>(context, listen: false).credential;

    final callOptions = grpc.CallOptions(
      // metadata: {
      //   'authorization': 'Bearer ${token.accessToken}',
      // },
      providers: [
        (metadata, uri) async {
          final token = await credential!.getTokenResponse();
          metadata['authorization'] = 'Bearer ${token.accessToken}';
        },
      ],
    );

    final channel = grpc.ClientChannel(
      serverAddress,
      port: mainServerPort,
      options: const grpc.ChannelOptions(
        credentials: grpc.ChannelCredentials.insecure(),
      ),
    );

    final serverClient = ServerServiceClient(channel, options: callOptions);
    final chatClient = ChatServiceClient(channel, options: callOptions);

    final voiceChannel = grpc.ClientChannel(
      serverAddress,
      port: voiceServerPort,
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
    );

    final voiceClient = VoiceServiceClient(voiceChannel, options: callOptions);

    return [
      Provider<ServerServiceClient>.value(value: serverClient),
      Provider<ChatServiceClient>.value(value: chatClient),
      Provider<VoiceServiceClient>.value(value: voiceClient),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getConnections(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return MultiProvider(
            providers: snapshot.data!,
            child: widget.child,
          );
        });
  }
}
