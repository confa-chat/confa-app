import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:konfa/auth/auth.dart';
import 'package:konfa/gen/proto/konfa/chat/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/hub/v1/auth_provider.pb.dart';
import 'package:konfa/gen/proto/konfa/hub/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/voice_relay/v1/service.pbgrpc.dart';
import 'package:konfa/repo/user.dart';
import 'package:provider/provider.dart';

const grpcCreds = grpc.ChannelCredentials.insecure();

class HubsManager {
  final Map<Uri, grpc.ClientChannel> _channels = {};
  final Map<Uri, HubConnection> _serviceConnections = {};

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

  Future<List<AuthProvider>> listAuthProviders(Uri uri) async {
    final channel = await _getChannel(uri);
    final client = HubServiceClient(channel);
    final response = await client.listAuthProviders(ListAuthProvidersRequest());
    return response.authProviders;
  }

  Future<AuthState> authOnProvider(Uri uri, AuthProvider provider) async {
    final state = AuthState();
    state.authenticate(provider);
    return state;
  }

  Future<HubConnection> connect(Uri uri, AuthState auth) async {
    if (_serviceConnections.containsKey(uri)) {
      return _serviceConnections[uri]!;
    }

    final channel = await _getChannel(uri);
    final service = await HubConnection.connect(channel, auth);
    _serviceConnections[uri] = service;
    return service;
  }
}

/// Manages all services and provides them to the widget tree
class HubConnection {
  final AuthState _authState;
  final HubServiceClient _hubClient;
  final ServerServiceClient _serverClient;
  final ChatServiceClient _chatClient;
  final UsersRepo _usersRepo;

  final Map<String, VoiceRelayServiceClient> _voiceRelayClients = {};

  HubConnection._(
    this._authState,
    this._hubClient,
    this._serverClient,
    this._chatClient,
    this._usersRepo,
  );

  Future<void> _authProvider(Map<String, String> metadata, String provider) async {
    final token = await _authState.getToken();
    metadata['authorization'] = 'Bearer ${token.accessToken}';
  }

  static Future<HubConnection> connect(grpc.ClientChannel channel, AuthState authState) async {
    final callOptions = grpc.CallOptions(
      metadata: {'authorization': 'Bearer ${(await authState.getToken()).accessToken}'},
      providers: [
        (metadata, uri) async {
          final token = await authState.getToken();
          metadata['authorization'] = 'Bearer ${token.accessToken}';
        },
      ],
    );

    final hubClient = HubServiceClient(channel, options: callOptions);
    final serverClient = ServerServiceClient(channel, options: callOptions);
    final chatClient = ChatServiceClient(channel, options: callOptions);

    final userRepo = await UsersRepo.create(serverClient);

    return HubConnection._(authState, hubClient, serverClient, chatClient, userRepo);
  }

  Future<VoiceRelayServiceClient> voiceRelayClient(String relayID) async {
    if (_voiceRelayClients.containsKey(relayID)) {
      return _voiceRelayClients[relayID]!;
    }

    final relaysResp = await _hubClient.listVoiceRelays(ListVoiceRelaysRequest());

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

  HubServiceClient get hubClient => _hubClient;
  ServerServiceClient get serverClient => _serverClient;
  ChatServiceClient get chatClient => _chatClient;
  UsersRepo get usersRepo => _usersRepo;
}

/// Extension methods to easily access services from BuildContext
extension HubConnectionExtension on BuildContext {
  HubsManager get manager => read<HubsManager>();
  HubConnection connection(String hubID) {
    final uri = Uri.parse(hubID);
    return read<HubsManager>()._serviceConnections[uri] ??
        (throw Exception('No connection found for hubID: $hubID'));
  }

  HubConnection get hub => read<HubConnection>();
}
