import 'package:flutter/material.dart';
import 'package:confa/gen/proto/confa/node/v1/service.pbgrpc.dart';
import 'package:confa/screens/server_screen.dart';
import 'dart:io' show Platform;
import 'package:confa/services/connection_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:confa/widgets/loading.dart';
import 'package:provider/provider.dart';

part 'server_selection_screen.g.dart';

@TypedGoRoute<ServerSelectionScreenRoute>(path: '/hub/:hubID/servers')
@immutable
class ServerSelectionScreenRoute extends GoRouteData {
  final String hubID;
  const ServerSelectionScreenRoute({required this.hubID});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoadingBuilder(
      future: context.manager.getHubConnection(hubID),
      builder: (context, hub) {
        return Provider.value(value: hub, child: ServerSelectionScreen(hubID: hubID));
      },
    );
  }
}

class ServerSelectionScreen extends StatefulWidget {
  final String hubID;
  const ServerSelectionScreen({super.key, this.hubID = ''});

  @override
  State<ServerSelectionScreen> createState() => _ServerSelectionScreenState();
}

class _ServerSelectionScreenState extends State<ServerSelectionScreen> {
  Future<List<ServerInfo>>? _serversFuture;

  List<AuthProviderInfo> authProviders = [];
  List<VoiceRelayInfo> voiceRelays = [];

  @override
  void initState() {
    _serversFuture = _loadServers();

    super.initState();
  }

  Future<List<ServerInfo>> _loadServers() async {
    final response = await context.hub.nodeClient.listServerIDs(ListServersRequest());

    final servers =
        response.serverIds.map((id) {
          return ServerInfo(id: id, name: _generateServerName(id), description: "Server ID: $id");
        }).toList();

    return servers;
  }

  // Generate a more user-friendly name based on the server ID
  // In a real app, you might want to fetch actual server names from an API
  String _generateServerName(String id) {
    // Extract a shorter identifier if the ID is a UUID or similar
    final parts = id.split('-');
    if (parts.length > 1) {
      return 'Server ${parts.first}';
    }
    // Truncate very long IDs for display
    if (id.length > 10) {
      return 'Server ${id.substring(0, 8)}...';
    }
    return 'Server $id';
  }

  void _selectServer(ServerInfo server) {
    ServerScreenRoute(hubID: widget.hubID, serverID: server.id).go(context);
  }

  @override
  Widget build(BuildContext context) {
    // Check if we're on desktop platforms
    final isDesktop = Platform.isLinux || Platform.isWindows || Platform.isMacOS;
    // Use a more compact layout on desktop
    final isCompact = isDesktop;
    // Determine the width of the container based on platform
    final containerWidth = isCompact ? 600.0 : MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Server'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: null,
            // onPressed: _isLoading ? null : _refreshServers,
            tooltip: 'Refresh server list',
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: containerWidth,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Available Servers', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Expanded(
                child: FutureBuilder<List<ServerInfo>>(
                  future: _serversFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Loading servers...'),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, size: 48, color: Colors.red),
                            const SizedBox(height: 16),
                            Text(
                              'Error Loading Servers',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(snapshot.error.toString(), textAlign: TextAlign.center),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              // onPressed: null,
                              onPressed: null,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Try Again'),
                            ),
                          ],
                        ),
                      );
                    }
                    final servers = snapshot.data!;
                    if (servers.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.dns_outlined, size: 48, color: Colors.grey),
                            const SizedBox(height: 16),
                            Text(
                              'No Servers Available',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'There are no servers available on this hub.',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              // onPressed: _refreshServers,
                              onPressed: null,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Refresh'),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: servers.length,
                      itemBuilder: (context, index) {
                        final server = servers[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const Icon(Icons.dns),
                            title: Text(server.name),
                            subtitle: Text(server.description),
                            onTap: () => _selectServer(server),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServerInfo {
  final String id;
  final String name;
  final String description;
  ServerInfo({required this.id, required this.name, required this.description});
}

class VoiceRelayInfo {
  final String id;
  final String name;
  final String address;
  VoiceRelayInfo({required this.id, required this.name, required this.address});
}

class AuthProviderInfo {
  final String id;
  final String name;
  final String protocolType;
  final IconData icon;
  final bool isDefault;
  final VoidCallback onSelected;
  AuthProviderInfo({
    required this.id,
    required this.name,
    required this.protocolType,
    required this.icon,
    required this.isDefault,
    required this.onSelected,
  });
}
