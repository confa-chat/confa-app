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
      await manager.connect(hubUri, authState);
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

  Widget _buildAuthProviderItem(AuthProviderInfo provider) {
    return OutlinedButton(
      onPressed: provider.onSelected,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 8, child: Icon(provider.icon)),
          Text(provider.name),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Future<User> _getCurrentUser() async {
    final resp = await context
        .getHub(_selectedHub.address)
        .hubClient
        .currentUser(CurrentUserRequest());
    return resp.user;
  }

  Widget _buildUserProfileWidget() {
    return FutureBuilder(
      future: _getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final user = snapshot.data!;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
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
                      Text(
                        user.username,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Authenticated via ${_authState?.providerName ?? 'Unknown Provider'}',
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

  Widget _buildVoiceRelaySection() {
    if (voiceRelays.isEmpty) return const SizedBox.shrink();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        _selectedFederation.name,
                                        style: TextTheme.of(context).titleLarge,
                                        // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        _selectedHub.name,
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Text(_selectedHub.address, style: TextStyle(fontSize: 10)),
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
                _buildUserProfileWidget()
              else
                Flexible(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          if (voiceRelays.isNotEmpty) _buildVoiceRelaySection(),
                          Text('Authentication', style: TextTheme.of(context).headlineSmall),
                          SizedBox(height: 10),
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
                            Column(children: authProviders.map(_buildAuthProviderItem).toList()),
                          // Flexible(
                          //   child: ListView.builder(
                          //     itemCount: authProviders.length,
                          //     itemBuilder: (context, index) {
                          //       return _buildAuthProviderItem(authProviders[index]);
                          //     },
                          //   ),
                          // ),
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
                      padding: const EdgeInsets.all(12.0),
                      child: _buildVoiceRelaySection(),
                    ),
                  ),
                ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _authState == null ? null : _goToHubScreen,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text('Connect', style: TextStyle(fontSize: 14)),
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
