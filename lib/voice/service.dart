import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;
import 'package:konfa/voice/recorder.dart';
import 'package:konfa/voice/listener.dart';
import 'package:konfa/gen/proto/konfa/voice_relay/v1/service.pbgrpc.dart';

// Voice relay registry to keep track of available voice relays
class VoiceRelayRegistry {
  static final Map<String, VoiceRelayInfo> _relays = {};

  // Register a voice relay
  static void registerRelay(String id, String name, String address) {
    _relays[id] = VoiceRelayInfo(id: id, name: name, address: address);
  }

  // Get voice relay by ID
  static VoiceRelayInfo? getRelay(String id) {
    return _relays[id];
  }

  // Clear registry (usually when disconnecting)
  static void clear() {
    _relays.clear();
  }
}

class VoiceRelayInfo {
  final String id;
  final String name;
  final String address;

  VoiceRelayInfo({required this.id, required this.name, required this.address});

  // Parse the address to get host and port
  (String host, int port) parseAddress() {
    final parts = address.split(':');
    if (parts.length > 1) {
      return (parts[0], int.tryParse(parts[1]) ?? 8081);
    }
    return (address, 8081); // Default port if not provided
  }
}

const sampleRate = 48000;

class VoiceRelay {
  late VoiceRelayServiceClient _voiceServiceClient;
  final String selfUserID;
  String? _joinedChannelID;
  String? _currentRelayId;

  VoiceRelay(this._voiceServiceClient, this.selfUserID);

  // Create a new voice client for a specific relay
  VoiceRelayServiceClient _createVoiceClientForRelay(String relayId) {
    final relay = VoiceRelayRegistry.getRelay(relayId);
    if (relay == null) {
      throw Exception('Voice relay with ID $relayId not found');
    }

    final (host, port) = relay.parseAddress();

    final channel = grpc.ClientChannel(
      host,
      port: port,
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
    );

    return VoiceRelayServiceClient(channel);
  }

  Stream<UsersState> joinChannel(String serverID, String channelID, String relayId) async* {
    if (_joinedChannelID != null) {
      await leaveChannel();
    }

    try {
      // Switch to the specified voice relay
      if (_currentRelayId != relayId) {
        _voiceServiceClient = _createVoiceClientForRelay(relayId);
        _currentRelayId = relayId;
      }

      final respStream = _voiceServiceClient.joinChannel(
        JoinChannelRequest(serverId: serverID, channelId: channelID, userId: selfUserID),
      );

      final recorder = VoiceChatRecorder(_voiceServiceClient, serverID, channelID, selfUserID);
      await recorder.record();

      final listeners = <String, VoiceChatListener>{};

      await for (final resp in respStream) {
        if (resp.hasUsersState()) {
          for (final user in resp.usersState.userIds) {
            if (!listeners.containsKey(user)) {
              final listener = VoiceChatListener(_voiceServiceClient, serverID, channelID, user);
              await listener.listen();
              listeners[user] = listener;
            }
          }
          yield resp.usersState;
        }
      }

      recorder.stop();
      listeners.forEach((_, listener) => listener.stop());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> leaveChannel() async {
    if (_joinedChannelID == null) {
      return;
    }

    await Future.wait([
      VoiceChatListener(_voiceServiceClient, '', '', '').stop(),
      VoiceChatRecorder(_voiceServiceClient, '', '', '').stop(),
    ]);

    _joinedChannelID = null;
  }
}
