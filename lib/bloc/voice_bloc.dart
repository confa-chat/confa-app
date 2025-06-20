import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:confa/gen/proto/confa/voice_relay/v1/service.pbgrpc.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:confa/voice/listener.dart';
import 'package:confa/voice/recorder.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'voice_event.dart';
part 'voice_state.dart';

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  StreamSubscription? _voiceStreamSubscription;
  HubConnection? _hubConn;
  VoiceRelayServiceClient? _voiceRelay;

  (VoiceChatRecorder, Future<void>)? _recorder;
  final Map<String, (VoiceChatListener, Future<void>)> _listeners = {};

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

      await _voiceStreamSubscription?.cancel();

      _hubConn = event.conn;
      _voiceRelay = await event.conn.voiceRelayClient(event.voiceRelayId);
      final recorder = VoiceChatRecorder(
        _voiceRelay!,
        event.serverId,
        event.channelId,
        event.conn.usersRepo.currentUserId,
      );

      _recorder = (recorder, recorder.record());

      _voiceStreamSubscription = _voiceRelay!
          .joinChannel(
            JoinChannelRequest(
              serverId: event.serverId,
              channelId: event.channelId,
              userId: event.conn.usersRepo.currentUserId,
            ),
          )
          .listen(
            (resp) {
              add(
                VoiceChannelUpdateReceived(
                  resp.usersState,
                  serverId: event.serverId,
                  channelId: event.channelId,
                  voiceRelayId: event.voiceRelayId,
                ),
              );

              for (final userID in resp.usersState.userIds) {
                if (userID == event.conn.usersRepo.currentUserId) {
                  continue;
                }

                if (!_listeners.containsKey(userID)) {
                  final listener = VoiceChatListener(
                    _voiceRelay!,
                    event.serverId,
                    event.channelId,
                    userID,
                  );
                  _listeners[event.conn.usersRepo.currentUserId] = (listener, listener.listen());
                }
              }
            },
            onError: (error) {
              add(VoiceServerError(error.toString()));
            },
            onDone: () {
              add(VoiceServerDisconnect());
            },
          );
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
    // Future.wait<void>([_recorder!.stop(), _listener!.stop(), _soundFuture!.timeout(Duration(seconds: 3))]);

    if (_recorder != null) {
      await Future.wait([_recorder!.$1.stop(), _recorder!.$2]);
      _recorder = null;
    }

    for (final listener in _listeners.entries) {
      await Future.wait([listener.value.$1.stop(), listener.value.$2]);
    }

    _listeners.clear();

    await _voiceStreamSubscription?.cancel();
    _voiceStreamSubscription = null;
    // TODO currently not implemented await _voiceRelay!.leaveChannel();
    _voiceRelay = null;
    _hubConn = null;
    emit(VoiceDisconnected());
  }

  @override
  Future<void> close() {
    _voiceStreamSubscription?.cancel();
    // _voiceRelay?.leaveChannel();
    return super.close();
  }
}
