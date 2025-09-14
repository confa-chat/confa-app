import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:confa/gen/proto/confa/node/v1/service.pb.dart';
import 'package:confa/gen/proto/confa/voice/v1/voice_relay.pbgrpc.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:confa/src/rust/api/voice.dart' as libconfa_voice;

part 'voice_event.dart';
part 'voice_state.dart';

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  HubConnection? _hubConn;

  // this object need to be kept to maintain the voice channel
  // ignore: unused_field
  libconfa_voice.VoiceConnectionManager? _voiceConnection;

  VoiceBloc() : super(VoiceInitial()) {
    on<JoinVoiceChannel>(_onJoinVoiceChannel);
    on<LeaveVoiceChannel>(_onLeaveVoiceChannel);
    on<VoiceChannelUpdateReceived>(_onVoiceChannelUpdateReceived);
  }

  Future<void> _onJoinVoiceChannel(JoinVoiceChannel event, Emitter<VoiceState> emit) async {
    try {
      emit(VoiceLoading());

      if (Platform.isAndroid || Platform.isIOS) {
        await Permission.microphone.request();
      }

      final resp = await event.conn.nodeClient.listVoiceRelays(ListVoiceRelaysRequest());
      final voiceRelay = resp.voiceRelays.firstWhere(
        (relay) => relay.id == event.voiceRelayId,
        orElse: () => throw Exception('Voice relay not found'),
      );

      final voiceConnection = await libconfa_voice.VoiceConnectionManager.newInstance(
        relayAddress: "http://${voiceRelay.address}",
      );

      await voiceConnection.voiceJoin(
        serverId: event.serverId,
        channelId: event.channelId,
        userId: event.conn.usersRepo.currentUserId,
      );

      _voiceConnection = voiceConnection;
    } catch (e) {
      emit(VoiceError(e.toString()));
    }
  }

  Future<void> _onVoiceChannelUpdateReceived(
    VoiceChannelUpdateReceived event,
    Emitter<VoiceState> emit,
  ) async {
    if (state is VoiceLoading || state is VoiceChannelConnected) {
      // Extract the current channel info from the event
      String serverId = event.serverId;
      String channelId = event.channelId;
      String voiceRelayId = event.voiceRelayId;

      // Resolve display names for all users
      final Map<String, String> userDisplayNames = {};

      for (String userId in event.usersState.userIds) {
        try {
          final user = await _hubConn!.usersRepo.getUser(userId);
          userDisplayNames[userId] = user.username;
        } catch (e) {
          // If user data can't be fetched, use user ID as fallback
          userDisplayNames[userId] = userId;
        }
      }

      emit(
        VoiceChannelConnected(
          serverId: serverId,
          channelId: channelId,
          voiceRelayId: voiceRelayId,
          usersState: event.usersState,
          userDisplayNames: userDisplayNames,
        ),
      );
    }
  }

  Future<void> _onLeaveVoiceChannel(LeaveVoiceChannel event, Emitter<VoiceState> emit) async {
    _voiceConnection = null;
    _hubConn = null;
    emit(VoiceDisconnected());
  }

  @override
  Future<void> close() {
    _voiceConnection = null;
    _hubConn = null;
    return super.close();
  }
}
