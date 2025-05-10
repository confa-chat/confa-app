part of 'voice_bloc.dart';

@immutable
sealed class VoiceState {}

class VoiceInitial extends VoiceState {}

class VoiceLoading extends VoiceState {}

class VoiceChannelConnected extends VoiceState {
  final String serverId;
  final String channelId;
  final String voiceRelayId;
  final UsersState usersState;
  final Map<String, String> userDisplayNames;

  VoiceChannelConnected({
    required this.serverId,
    required this.channelId,
    required this.voiceRelayId,
    required this.usersState,
    required this.userDisplayNames,
  });
}

class VoiceDisconnected extends VoiceState {}

class VoiceError extends VoiceState {
  final String message;

  VoiceError(this.message);
}
