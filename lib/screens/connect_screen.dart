import 'package:flutter/material.dart';
import 'package:konfa/auth/auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _hubAddressController = TextEditingController();

  AuthState? _authState;

  // Selected federation and hub
  late final FederationInfo _selectedFederation;
  late HubInfo _selectedHub;

  // Lists to store voice relays and auth providers fetched from hub
  List<VoiceRelayInfo> voiceRelays = [];
  List<AuthProviderInfo> authProviders = [];
  bool _isLoading = false;
  bool _showCustomHubInput = false;

  // Sample federations
  final List<FederationInfo> knownFederations = [
    FederationInfo(name: "Konfa Federation", description: "Main Konfa Federation"),
  ];

  // Known hubs
  final List<HubInfo> knownHubs = [HubInfo(name: "Konfach Hub", address: "http://49.13.3.4:38100")];

  @override
  void initState() {
    super.initState();
    // Set default federation and hub automatically
    _selectedFederation = knownFederations.first;
    _selectedHub = knownHubs.first;

    _hubAddressController.text = _selectedHub.address;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch voice relays and auth providers when the widget is built
      _fetchHubData();
    });
  }

  @override
  void dispose() {
    _hubAddressController.dispose();
    super.dispose();
  }

  // Fetch voice relays and auth providers from the hub
  Future<void> _fetchHubData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final hubClient = context.manager;

      final hubUri = Uri.parse(_hubAddressController.text);
      final authProvidersResp = await hubClient.listAuthProviders(hubUri);

      // Update the state with the fetched data
      setState(() {
        authProviders =
            authProvidersResp.map((provider) {
              // Determine the protocol type and icon based on the provider's structure
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
                isDefault: provider.id == authProvidersResp.first.id, // Mark first one as default
                onSelected: () async {
                  final uri = Uri.parse(_hubAddressController.text);
                  final authState = await context.manager.authOnProvider(uri, provider);
                  setState(() {
                    _authState = authState;
                  });
                },
              );
            }).toList();

        _isLoading = false;
        _showCustomHubInput = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to connect to hub: ${e.toString()}')));
    }
  }

  void _connectToHub() async {
    final hubUri = Uri.parse(_hubAddressController.text);
    // if (addressAndPort == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Invalid address format. Must include port (e.g., server:38100)'),
    //     ),
    //   );
    //   return;
    // }

    await context.manager.connect(hubUri, _authState!);

    ServerSelectionScreenRoute(hubID: _selectedHub.address).go(context);
  }

  void _toggleCustomHubInput() {
    setState(() {
      _showCustomHubInput = !_showCustomHubInput;
    });
  }

  Widget _buildCustomHubInput() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TextFormField(
            controller: _hubAddressController,
            decoration: const InputDecoration(
              labelText: 'Hub Address',
              hintText: 'Enter hub address and port (e.g., https://server:38100)',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a hub address';
              }
              if (Uri.tryParse(value) == null) {
                return 'Invalid address format (e.g., https://server:38100)';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _connectToHub,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child:
                      _isLoading
                          ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                          : const Text('Connect'),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: _toggleCustomHubInput, child: const Text('Cancel')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAuthProviderItem(AuthProviderInfo provider, bool isCompact) {
    if (isCompact) {
      return ListTile(
        leading: Icon(provider.icon, size: 20),
        title: Text(provider.name, style: const TextStyle(fontSize: 14)),
        dense: true,
        onTap: provider.onSelected,
      );
    } else {
      return Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: Icon(provider.icon),
          title: Text(provider.name),
          subtitle: Text('Protocol: ${provider.protocolType}'),
          trailing: provider.isDefault ? const Chip(label: Text('Default')) : null,
          onTap: provider.onSelected,
        ),
      );
    }
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
    final containerWidth = isCompact ? 400.0 : MediaQuery.of(context).size.width;
    final containerPadding = isCompact ? const EdgeInsets.all(12.0) : const EdgeInsets.all(16.0);

    return Scaffold(
      body: Center(
        child: Container(
          width: containerWidth,
          padding: containerPadding,
          child: Column(
            mainAxisSize: isCompact ? MainAxisSize.min : MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Connect to Hub',
                style: TextStyle(fontSize: isCompact ? 20 : 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isCompact ? 12 : 16),
              Card(
                child: Padding(
                  padding: isCompact ? const EdgeInsets.all(12.0) : const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.public,
                            color: Theme.of(context).primaryColor,
                            size: isCompact ? 18 : 24,
                          ),
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
                      SizedBox(height: isCompact ? 8 : 12),
                      Row(
                        children: [
                          Icon(
                            Icons.hub,
                            color: Theme.of(context).primaryColor,
                            size: isCompact ? 18 : 24,
                          ),
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
                          TextButton.icon(
                            onPressed: _toggleCustomHubInput,
                            icon: const Icon(Icons.edit, size: 16),
                            label: Text('Custom', style: TextStyle(fontSize: isCompact ? 12 : 14)),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ],
                      ),
                      if (_showCustomHubInput) _buildCustomHubInput(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: isCompact ? 12 : 16),
              Flexible(
                child: Card(
                  child: Padding(
                    padding: isCompact ? const EdgeInsets.all(12.0) : const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: isCompact ? MainAxisSize.min : MainAxisSize.max,
                      children: [
                        if (voiceRelays.isNotEmpty) _buildVoiceRelaySection(isCompact),
                        Text(
                          'Authentication',
                          style: TextStyle(
                            fontSize: isCompact ? 14 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isCompact ? 4 : 8),
                        if (_isLoading)
                          const Center(child: CircularProgressIndicator())
                        else if (authProviders.isEmpty)
                          Center(
                            child: Text(
                              'No authentication providers available',
                              style: TextStyle(fontSize: isCompact ? 12 : 14),
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
              SizedBox(height: isCompact ? 12 : 16),
              ElevatedButton(
                onPressed: _authState == null ? null : _connectToHub,
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

class OpenIdSettings {
  final String issuer;
  final String clientId;
  final String clientSecret;

  OpenIdSettings({required this.issuer, required this.clientId, required this.clientSecret});
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
