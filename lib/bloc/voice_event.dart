part of 'voice_bloc.dart';

@immutable
sealed class VoiceEvent {}

class JoinVoiceChannel extends VoiceEvent {
  final HubConnection conn;
  final String serverId;
  final String channelId;
  final String voiceRelayId;

  JoinVoiceChannel({
    required this.conn,
    required this.serverId,
    required this.channelId,
    required this.voiceRelayId,
  });
}

class LeaveVoiceChannel extends VoiceEvent {}

class VoiceChannelUpdateReceived extends VoiceEvent {
  final UsersState usersState;
  final String serverId;
  final String channelId;
  final String voiceRelayId;

  VoiceChannelUpdateReceived(
    this.usersState, {
    required this.serverId,
    required this.channelId,
    required this.voiceRelayId,
  });
}
