import 'package:flutter/material.dart';
import 'package:konfa/auth/auth.dart';
import 'package:konfa/auth/connection_settings.dart';
import 'package:konfa/gen/proto/konfa/chat/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/hub/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/voice_relay/v1/service.pbgrpc.dart';
import 'package:konfa/repo/user.dart';
import 'package:konfa/voice/service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfa/bloc/voice_bloc.dart';
import 'package:go_router/go_router.dart';

// part 'loading_screen.g.dart';

// @TypedGoRoute<LoadingScreenRoute>(path: '/loading')
// @immutable
// class LoadingScreenRoute extends GoRouteData {
//   final String childRoute;

//   const LoadingScreenRoute({required this.childRoute});

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     // Navigate to the child route after loading is complete
//     return LoadingScreen(
//       onLoadingComplete: () {
//         context.go(childRoute);
//       },
//     );
//   }
// }

// class LoadingScreen extends StatefulWidget {
//   final VoidCallback? onLoadingComplete;
//   final Widget? child;

//   const LoadingScreen({super.key, this.child, this.onLoadingComplete});

//   @override
//   State<LoadingScreen> createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   late Future<List<SingleChildWidget>> _connectionFuture;
//   bool _hasInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the connection future once in initState
//     _connectionFuture = _setupConnection();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // Re-initialize if dependencies change and we haven't done so yet
//     if (!_hasInitialized) {
//       _connectionFuture = _setupConnection();
//       _hasInitialized = true;
//     }
//   }

//   // Create a gRPC client with token-refreshing capability
//   grpc.CallOptions _createAuthCallOptions(AuthState authState) {
//     return grpc.CallOptions(
//       providers: [
//         (metadata, uri) async {
//           final token = await authState.getToken();
//           metadata['authorization'] = 'Bearer ${token.accessToken}';
//         },
//       ],
//     );
//   }

//   Future<List<SingleChildWidget>> _setupConnection() async {
//     // Get connection settings from provider
//     final connectionSettings = Provider.of<ConnectionSettings>(context, listen: false);
//     final authState = Provider.of<AuthState>(context, listen: false);

//     if (!connectionSettings.isConnected) {
//       throw Exception('No connection settings available. Please connect to a hub first.');
//     }

//     final String serverAddress = connectionSettings.hubAddress;
//     final int mainServerPort = connectionSettings.mainPort;
//     final int voiceServerPort = connectionSettings.voicePort;

//     // Create call options with automatic token refreshing
//     final callOptions = _createAuthCallOptions(authState);

//     // Connect to the selected hub
//     final channel = grpc.ClientChannel(
//       serverAddress,
//       port: mainServerPort,
//       options: const grpc.ChannelOptions(
//         credentials: grpc.ChannelCredentials.insecure(),
//         // Add connection timeout
//         connectionTimeout: Duration(seconds: 10),
//       ),
//     );

//     final serverClient = ServerServiceClient(channel, options: callOptions);
//     final chatClient = ChatServiceClient(channel, options: callOptions);
//     final hubClient = HubServiceClient(channel, options: callOptions);

//     final voiceChannel = grpc.ClientChannel(
//       serverAddress,
//       port: voiceServerPort,
//       options: const grpc.ChannelOptions(
//         credentials: grpc.ChannelCredentials.insecure(),
//         connectionTimeout: Duration(seconds: 10),
//       ),
//     );

//     final voiceClient = VoiceRelayServiceClient(voiceChannel, options: callOptions);
//     final userRepo = await UsersRepo.create(serverClient);
//     final voiceService = VoiceRelay(voiceClient, userRepo.currentUserId);

//     // If there's an onLoadingComplete callback, call it since we've successfully connected
//     if (widget.onLoadingComplete != null) {
//       Future.microtask(() => widget.onLoadingComplete!());
//     }

//     return [
//       Provider<ServerServiceClient>.value(value: serverClient),
//       Provider<ChatServiceClient>.value(value: chatClient),
//       Provider<VoiceRelayServiceClient>.value(value: voiceClient),
//       Provider<HubServiceClient>.value(value: hubClient),
//       Provider<UsersRepo>.value(value: userRepo),
//       Provider<VoiceRelay>.value(value: voiceService),
//       BlocProvider<VoiceBloc>(create: (context) => VoiceBloc(voiceService, userRepo)),
//     ];
//   }

//   void _retryConnection() {
//     setState(() {
//       _connectionFuture = _setupConnection();
//     });
//   }

//   void _resetConnection() {
//     // Reset the connection settings
//     Provider.of<ConnectionSettings>(context, listen: false).reset();

//     // Navigate back to the connect screen using go_router
//     context.go('/connect');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<SingleChildWidget>>(
//       future: _connectionFuture,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.error_outline, size: 48, color: Colors.red),
//                   const SizedBox(height: 16),
//                   Text('Connection Error', style: Theme.of(context).textTheme.titleLarge),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                     child: Text(snapshot.error.toString(), textAlign: TextAlign.center),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: _retryConnection,
//                         child: const Text('Retry Connection'),
//                       ),
//                       const SizedBox(width: 16),
//                       OutlinedButton(
//                         onPressed: _resetConnection,
//                         child: const Text('Back to Connect Screen'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }

//         if (!snapshot.hasData) {
//           return const Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 16),
//                   Text('Connecting to server...'),
//                 ],
//               ),
//             ),
//           );
//         }

//         // If we have a child widget, wrap it with the MultiProvider
//         if (widget.child != null) {
//           return MultiProvider(providers: snapshot.data!, child: widget.child!);
//         }

//         // Otherwise show a success message
//         return Scaffold(
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.check_circle, size: 48, color: Colors.green),
//                 const SizedBox(height: 16),
//                 Text('Connection Successful', style: Theme.of(context).textTheme.titleLarge),
//                 const SizedBox(height: 16),
//                 const Text('Redirecting...'),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
