import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc_connection_interface.dart';
import 'package:confa/auth/auth.dart';
import 'package:confa/gen/proto/confa/chat/v1/service.pbgrpc.dart';
import 'package:confa/gen/proto/confa/node/v1/auth_provider.pb.dart';
import 'package:confa/gen/proto/confa/node/v1/service.pbgrpc.dart';
import 'package:confa/gen/proto/confa/server/v1/service.pbgrpc.dart';
import 'package:confa/gen/proto/confa/voice_relay/v1/service.pbgrpc.dart';
import 'package:confa/repo/user.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

const grpcCreds = grpc.ChannelCredentials.insecure();

class HubsManager {
  final Map<Uri, grpc.ClientChannel> _channels = {};
  final Map<Uri, HubConnection> _hubConnections = {};

  HubsManager();

  Future<grpc.ClientChannel> _getChannel(Uri uri) async {
    if (_channels.containsKey(uri)) {
      return _channels[uri]!;
    }

    grpc.ClientChannel channel = grpc.ClientChannel(
      uri.host,
      port: uri.port,
      options: const grpc.ChannelOptions(credentials: grpcCreds),
    );

    _channels[uri] = channel;
    return channel;
  }

  Future<AuthState?> tryLoadSavedAuth(Uri hub) async {
    final providers = await listAuthProvidersOnHub(hub);
    final authState = await AuthState.tryLoadSavedAuth(hub, providers);
    if (authState == null) {
      return null;
    }
    await connect(hub, authState);
    return authState;
  }

  Future<AuthState> authOnProvider(Uri hub, AuthProvider provider) async {
    final authState = await AuthState.authenticate(hub, provider);

    await connect(hub, authState);

    return authState;
  }

  Future<HubConnection?> tryRestoreHubConnection(Uri uri) async {
    if (_hubConnections.containsKey(uri)) {
      return _hubConnections[uri]!;
    }

    final authState = await AuthState.tryLoadSavedAuth(uri, await listAuthProvidersOnHub(uri));
    if (authState == null) {
      return null;
    }

    return await connect(uri, authState);
  }

  Future<HubConnection> connect(Uri uri, AuthState auth) async {
    if (_hubConnections.containsKey(uri)) {
      return _hubConnections[uri]!;
    }

    final channel = await _getChannel(uri);
    final service = await HubConnection.connect(uri, channel, auth);
    _hubConnections[uri] = service;
    return service;
  }

  Future<HubConnection> getHubConnection(String hubID) async {
    final Uri hubUri = Uri.parse(hubID);

    if (_hubConnections.containsKey(hubUri)) {
      return _hubConnections[hubUri]!;
    }

    final restoredConnection = await tryRestoreHubConnection(hubUri);
    if (restoredConnection != null) {
      return restoredConnection;
    }

    throw Exception('No connection found for hubID: $hubID');
  }

  Future<List<AuthProvider>> listAuthProvidersOnHub(Uri hub) async {
    final channel = await _getChannel(hub);
    final client = NodeServiceClient(channel);
    final response = await client.listAuthProviders(ListAuthProvidersRequest());
    return response.authProviders;
  }

  Future<VersionInfo> checkVersion(Uri hubID) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;

    final hub = await _getChannel(hubID);
    final client = NodeServiceClient(hub);

    try {
      final response = await client.supportedClientVersions(
        SupportedClientVersionsRequest(currentVersion: currentVersion),
      );

      return VersionInfo(
        supported: response.supported,
        minVersion: response.minVersion,
        currentVersion: currentVersion,
      );
    } catch (e) {
      // If we can't fetch version info, assume it's supported
      return VersionInfo(supported: true, minVersion: "unknown", currentVersion: currentVersion);
    }
  }
}

class VersionInfo {
  final bool supported;
  final String minVersion;
  final String currentVersion;

  VersionInfo({required this.supported, required this.minVersion, required this.currentVersion});
}

/// Manages all services and provides them to the widget tree
class HubConnection {
  final Uri baseUri;

  final AuthState _authState;
  final NodeServiceClient _nodeClient;
  final ServerServiceClient _serverClient;
  final ChatServiceClient _chatClient;
  final UsersRepo _usersRepo;

  final Map<String, VoiceRelayServiceClient> _voiceRelayClients = {};

  HubConnection._(
    this.baseUri,
    this._authState,
    this._nodeClient,
    this._serverClient,
    this._chatClient,
    this._usersRepo,
  );

  Future<void> _authProvider(Map<String, String> metadata, String provider) async {
    final token = await _authState.getToken();
    metadata['authorization'] = 'Bearer ${token.accessToken}';
  }

  static Future<HubConnection> connect(
    Uri baseUrl,
    grpc.ClientChannel channel,
    AuthState authState,
  ) async {
    final callOptions = grpc.CallOptions(
      metadata: {'authorization': 'Bearer ${(await authState.getToken()).accessToken}'},
      providers: [
        (metadata, uri) async {
          final token = await authState.getToken();
          metadata['authorization'] = 'Bearer ${token.accessToken}';
        },
      ],
    );

    final nodeClient = NodeServiceClient(channel, options: callOptions);
    final serverClient = ServerServiceClient(channel, options: callOptions);
    final chatClient = ChatServiceClient(channel, options: callOptions);

    final userRepo = await UsersRepo.create(nodeClient, serverClient);

    return HubConnection._(baseUrl, authState, nodeClient, serverClient, chatClient, userRepo);
  }

  Future<VoiceRelayServiceClient> voiceRelayClient(String relayID) async {
    if (_voiceRelayClients.containsKey(relayID)) {
      return _voiceRelayClients[relayID]!;
    }

    final relaysResp = await _nodeClient.listVoiceRelays(ListVoiceRelaysRequest());

    final relay = relaysResp.voiceRelays.firstWhere(
      (r) => r.id == relayID,
      orElse: () => throw Exception('Relay not found'),
    );

    if (!relay.address.contains("://")) {
      relay.address = "dns://${relay.address}";
    }

    final relayUri = Uri.parse(relay.address);

    final relayChannel = grpc.ClientChannel(
      relayUri.host,
      port: relayUri.port,
      options: grpc.ChannelOptions(credentials: grpcCreds),
    );

    final client = VoiceRelayServiceClient(
      relayChannel,
      options: grpc.CallOptions(providers: [_authProvider]),
    );

    _voiceRelayClients[relayID] = client;

    return client;
  }

  NodeServiceClient get nodeClient => _nodeClient;
  ServerServiceClient get serverClient => _serverClient;
  ChatServiceClient get chatClient => _chatClient;
  UsersRepo get usersRepo => _usersRepo;
}

/// Extension methods to easily access services from BuildContext
extension HubConnectionExtension on BuildContext {
  HubsManager get manager => read<HubsManager>();
  HubConnection get hub => read<HubConnection>();
}
