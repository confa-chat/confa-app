import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isolate_generator_annotation/isolate_generator_annotation.dart';
import 'package:confa/bloc/connection_cubit.dart';
import 'package:confa/gen/proto/confa/node/v1/auth_provider.pb.dart';
import 'package:confa/gen/proto/confa/node/v1/service.pb.dart';
import 'package:confa/gen/proto/confa/node/v1/service.pbgrpc.dart';
import 'package:confa/gen/proto/confa/user/v1/user.pb.dart';
import 'package:confa/screens/server_selection_screen.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:go_router/go_router.dart';

part 'connect_screen.g.dart';

@TypedGoRoute<ConnectScreenRoute>(path: '/connect')
@immutable
class ConnectScreenRoute extends GoRouteData with _$ConnectScreenRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConnectScreen();
  }
}

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  void initState() {
    super.initState();
    // FIXME connect to first node for testing
    context.read<ConnectionCubit>().connectToNode();
  }

  void _goToHubScreen(Uri hubAddress) {
    ServerSelectionScreenRoute(hubUrl: hubAddress).go(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: BlocConsumer<ConnectionCubit, ConnectionState>(
            listener: (context, state) {
              if (state is ConnectionError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is ConnectionInfoLoaded) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Connection',
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),

                    // Node selection card
                    _buildNodeSelectionCard(state),
                    SizedBox(height: 16),

                    // Version info card
                    _buildVersionInfoCard(state),
                    SizedBox(height: 16),

                    // Auth card
                    _buildAuthCard(state),
                    SizedBox(height: 12),

                    // Connect button
                    _buildConnectButton(state),
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNodeSelectionCard(ConnectionInfoLoaded state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.hub),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Node', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(
                          state.selectedNode.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(state.selectedNode.address.toString(), style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: null, // TODO: Implement node editing
              icon: const Icon(Icons.edit),
              label: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionInfoCard(ConnectionInfoLoaded state) {
    final isSupported = state.versionInfo.supported;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              isSupported ? Icons.check_circle : Icons.warning,
              color: isSupported ? Colors.green : Colors.orange,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSupported ? 'Client version compatible' : 'Client version not compatible',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSupported ? Colors.green : Colors.orange,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Current version: ${state.versionInfo.currentVersion}',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Minimum required: ${state.versionInfo.minVersion}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthCard(ConnectionInfoLoaded state) {
    if (state is ConnectionInfoAuthenticationInProgress) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [CircularProgressIndicator(), SizedBox(width: 12), Text('Authenticating...')],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: state is ConnectionInfoAuthenticated
            ? _buildUserProfileWidget(state)
            : _buildAuthProvidersWidget(state.authProviders),
      ),
    );
  }

  Widget _buildAuthProvidersWidget(List<AuthProvider> authProviders) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Auth with', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        ...authProviders.map(
          (provider) => OutlinedButton(
            onPressed: () {
              context.read<ConnectionCubit>().authenticateWithProvider(provider);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 8, child: Icon(Icons.security)),
                Text(provider.name),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserProfileWidget(ConnectionInfoAuthenticated state) {
    return FutureBuilder<User>(
      future: _getCurrentUser(state.selectedNode.address),
      builder: (context, snapshot) {
        if (snapshot.connectionState == widgets.ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final user = snapshot.data!;

        return Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).primaryColor.withAlpha(0x33),
              child: Icon(Icons.person, size: 24, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    'Authenticated via ${state.authState.providerName}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.logout, size: 16),
              label: const Text('Sign Out'),
              onPressed: () {
                context.read<ConnectionCubit>().signOut();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                foregroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildConnectButton(ConnectionState state) {
    return ElevatedButton(
      onPressed: state is ConnectionInfoAuthenticated && state.canConnect()
          ? () => _goToHubScreen(state.selectedNode.address)
          : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8),
        minimumSize: Size(double.infinity, 40),
      ),
      child: Text('Connect', style: TextStyle(fontSize: 14)),
    );
  }

  Future<User> _getCurrentUser(Uri hubAddress) async {
    final hub = await context.manager.getHubConnection(hubAddress);
    return (await hub.nodeClient.currentUser(CurrentUserRequest())).user;
  }
}
