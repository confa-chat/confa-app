import 'package:flutter/material.dart';
import 'package:konfa/auth/auth.dart';
import 'package:konfa/gen/proto/konfa/hub/v1/auth_provider.pb.dart';
import 'package:konfa/gen/proto/konfa/hub/v1/service.pb.dart';
import 'package:konfa/gen/proto/konfa/user/v1/user.pb.dart';
import 'package:konfa/screens/server_selection_screen.dart';
import 'dart:io' show Platform;
import 'package:konfa/services/connection_manager.dart';
import 'package:go_router/go_router.dart';

part 'connect_screen.g.dart';

@TypedGoRoute<ConnectScreenRoute>(path: '/connect')
@immutable
class ConnectScreenRoute extends GoRouteData {
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
  final _hubAddressController = TextEditingController();

  AuthState? _authState;

  // Selected federation and hub
  late final FederationInfo _selectedFederation;
  late HubInfo _selectedHub;

  // Lists to store voice relays and auth providers fetched from hub
  List<VoiceRelayInfo> voiceRelays = [];
  List<AuthProviderInfo> authProviders = [];
  bool _isLoading = false;

  // Sample federations
  final List<FederationInfo> knownFederations = [
    FederationInfo(name: "Konfa Federation", description: "Main Konfa Federation"),
  ];

  // Known hubs
  final List<HubInfo> knownHubs = [HubInfo(name: "Konfach Hub", address: "dns://49.13.3.4:38100")];

  @override
  void initState() {
    super.initState();
    // Set default federation and hub automatically
    _selectedFederation = knownFederations.first;
    _selectedHub = knownHubs.first;

    _hubAddressController.text = _selectedHub.address;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchHubData();
    });
  }

  @override
  void dispose() {
    _hubAddressController.dispose();
    super.dispose();
  }

  Future<void> _fetchHubData() async {
    setState(() {
      _isLoading = true;
    });

    final hubUri = Uri.parse(_hubAddressController.text);

    try {
      final authProvidersResp = await context.manager.listAuthProviders(hubUri);

      // Update the state with the fetched data
      setState(() {
        authProviders =
            authProvidersResp.map((provider) {
              String protocolType = "Unknown";
              IconData protocolIcon = Icons.question_mark;

              if (provider.hasOpenidConnect()) {
                protocolType = "OpenID Connect";
                protocolIcon = Icons.security;
              }

              return AuthProviderInfo(
                id: provider.id,
                name: provider.name,
                protocolType: protocolType,
                icon: protocolIcon,
                onSelected: () {
                  _authenticate(hubUri, provider);
                },
              );
            }).toList();

        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      _showError('Failed to connect to hub: ${e.toString()}');
    }
  }

  Future<void> _authenticate(Uri hubUri, AuthProvider provider) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final manager = context.manager;
      final authState = await manager.authOnProvider(hubUri, provider);
      setState(() {
        _authState = authState;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      _showError('Failed to authenticate: ${e.toString()}');
    }
  }

  void _showError(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  void _goToHubScreen() async {
    ServerSelectionScreenRoute(hubID: _selectedHub.address).go(context);
  }

  // void _toggleCustomHubInput() {
  //   setState(() {
  //     _showCustomHubInput = !_showCustomHubInput;
  //   });
  // }

  // Widget _buildCustomHubInput() {
  //   return Form(
  //     key: _formKey,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const SizedBox(height: 8),
  //         TextFormField(
  //           controller: _hubAddressController,
  //           decoration: const InputDecoration(
  //             labelText: 'Hub Address',
  //             hintText: 'Enter hub address and port (e.g., https://server:38100)',
  //             border: OutlineInputBorder(),
  //           ),
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //               return 'Please enter a hub address';
  //             }
  //             if (Uri.tryParse(value) == null) {
  //               return 'Invalid address format (e.g., https://server:38100)';
  //             }
  //             return null;
  //           },
  //         ),
  //         const SizedBox(height: 16),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: ElevatedButton(
  //                 onPressed: _goToHubScreen,
  //                 style: ElevatedButton.styleFrom(
  //                   padding: const EdgeInsets.symmetric(vertical: 12),
  //                 ),
  //                 child:
  //                     _isLoading
  //                         ? const SizedBox(
  //                           height: 20,
  //                           width: 20,
  //                           child: CircularProgressIndicator(strokeWidth: 2),
  //                         )
  //                         : const Text('Connect'),
  //               ),
  //             ),
  //             const SizedBox(width: 8),
  //             OutlinedButton(onPressed: _toggleCustomHubInput, child: const Text('Cancel')),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildAuthProviderItem(AuthProviderInfo provider, bool isCompact) {
    return ListTile(
      leading: Icon(provider.icon),
      title: Text(provider.name),
      subtitle: Text('Protocol: ${provider.protocolType}'),
      // trailing: provider.isDefault ? const Chip(label: Text('Default')) : null,
      onTap: provider.onSelected,
    );
  }

  Future<User> _getCurrentUser() async {
    final resp = await context
        .getHub(_selectedHub.address)
        .hubClient
        .currentUser(CurrentUserRequest());
    return resp.user;
  }

  Widget _buildUserProfileWidget(bool isCompact) {
    return FutureBuilder(
      future: _getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = snapshot.data!;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: isCompact ? 24 : 30,
                      backgroundColor: Theme.of(context).primaryColor.withAlpha(0x33),
                      child: Icon(
                        Icons.person,
                        size: isCompact ? 24 : 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.username,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isCompact ? 16 : 18,
                            ),
                          ),
                          Text(
                            'Authenticated via ${_authState?.providerName ?? 'Unknown Provider'}',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.logout, size: 16),
                  label: const Text('Sign Out'),
                  onPressed: () {
                    setState(() {
                      _authState = null;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    foregroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceRelaySection(bool isCompact) {
    if (voiceRelays.isEmpty) return const SizedBox.shrink();

    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Voice Relays', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          ...voiceRelays.map(
            (relay) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  const Icon(Icons.mic, size: 14),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      relay.name,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Available Voice Relays',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: voiceRelays.length,
              itemBuilder: (context, index) {
                final relay = voiceRelays[index];
                return Card(
                  margin: const EdgeInsets.only(right: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.mic, size: 24),
                        Text(relay.name),
                        Text('ID: ${relay.id}', style: const TextStyle(fontSize: 10)),
                        Text(relay.address, style: const TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Platform.isLinux || Platform.isWindows || Platform.isMacOS;
    final isCompact = isDesktop;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: isCompact ? MainAxisSize.min : MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Connect to Hub',
                // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                style: TextTheme.of(context).headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.public),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Federation',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isCompact ? 12 : 14,
                                        ),
                                      ),
                                      Text(
                                        _selectedFederation.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: isCompact ? 14 : 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.hub),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hub',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isCompact ? 12 : 14,
                                        ),
                                      ),
                                      Text(
                                        _selectedHub.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: isCompact ? 14 : 16,
                                        ),
                                      ),
                                      Text(
                                        _selectedHub.address,
                                        style: TextStyle(fontSize: isCompact ? 10 : 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        // TODO onPressed: _toggleCustomHubInput,
                        icon: const Icon(Icons.edit),
                        label: Text('Edit'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Show profile card if authenticated
              if (_authState != null)
                _buildUserProfileWidget(isCompact)
              else
                Flexible(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: isCompact ? MainAxisSize.min : MainAxisSize.max,
                        children: [
                          if (voiceRelays.isNotEmpty) _buildVoiceRelaySection(isCompact),
                          Text('Authentication', style: TextTheme.of(context).titleMedium),
                          SizedBox(height: 8),
                          if (_isLoading)
                            const Center(child: CircularProgressIndicator())
                          else if (authProviders.isEmpty)
                            Center(
                              child: Text(
                                'No authentication providers available',
                                style: TextTheme.of(context).titleMedium,
                              ),
                            )
                          else
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: isCompact,
                                itemCount: authProviders.length,
                                itemBuilder: (context, index) {
                                  return _buildAuthProviderItem(authProviders[index], isCompact);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              // Show voice relays card only if authenticated and if there are voice relays
              if (_authState != null && voiceRelays.isNotEmpty)
                Flexible(
                  child: Card(
                    child: Padding(
                      padding: isCompact ? const EdgeInsets.all(12.0) : const EdgeInsets.all(16.0),
                      child: _buildVoiceRelaySection(isCompact),
                    ),
                  ),
                ),
              SizedBox(height: isCompact ? 12 : 16),
              ElevatedButton(
                onPressed: _authState == null ? null : _goToHubScreen,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: isCompact ? 8 : 12),
                  minimumSize: Size(double.infinity, isCompact ? 40 : 48),
                ),
                child: Text('Connect', style: TextStyle(fontSize: isCompact ? 14 : 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
  final VoidCallback onSelected;

  AuthProviderInfo({
    required this.id,
    required this.name,
    required this.protocolType,
    required this.icon,
    required this.onSelected,
  });
}

class HubInfo {
  final String name;
  final String address;

  HubInfo({required this.name, required this.address});
}

class FederationInfo {
  final String name;
  final String description;

  FederationInfo({required this.name, required this.description});
}
