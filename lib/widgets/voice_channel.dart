import 'package:confa/gen/proto/confa/voice/v1/voice_relay.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confa/bloc/voice_bloc.dart';
import 'package:confa/gen/proto/confa/channel/v1/channels.pb.dart';
import 'package:confa/services/connection_manager.dart';

class VoiceChannelWidget extends StatelessWidget {
  final VoiceChannel channel;

  const VoiceChannelWidget({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceBloc, VoiceState>(
      builder: (context, state) {
        if (state is VoiceLoading) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.mic),
                title: Text(channel.name),
                trailing: const CircularProgressIndicator(),
              ),
            ],
          );
        }

        // if (state is VoiceChannelConnected &&
        //     state.channelId == channel.channelId &&
        //     state.serverId == channel.serverId) {
        //   return _ActiveVoiceChannelListTile(channel: channel, state: state);
        // }

        // return _InactiveVoiceChannelListTile(channel: channel);

        return _VoiceChannelListTile(channel: channel);
      },
    );
  }
}

// class _InactiveVoiceChannelListTile extends StatelessWidget {
//   final VoiceChannel channel;

//   const _InactiveVoiceChannelListTile({required this.channel});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VoiceBloc, VoiceState>(
//       builder: (context, state) {
//         return ListTile(
//           leading: const Icon(Icons.mic),
//           title: Text(channel.name),
//           selected: false,
//           onTap: () => context.read<VoiceBloc>().add(
//             JoinVoiceChannel(
//               conn: context.read<HubConnection>(),
//               serverId: channel.serverId,
//               channelId: channel.channelId,
//               voiceRelayId: channel.voiceRelayId[0],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _ActiveVoiceChannelListTile extends StatelessWidget {
//   final VoiceChannel channel;
//   final VoiceChannelConnected state;

//   const _ActiveVoiceChannelListTile({required this.channel, required this.state});

//   @override
//   Widget build(BuildContext context) {
//     final users = state.usersState.userIds;

//     return Column(
//       children: [
//         ListTile(
//           leading: const Icon(Icons.mic),
//           title: Text(channel.name),
//           trailing: IconButton(
//             icon: const Icon(Icons.call_end),
//             onPressed: () => context.read<VoiceBloc>().add(LeaveVoiceChannel()),
//           ),
//         ),
//         if (users.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(left: 32),
//             child: SizedBox(
//               height: users.length * 40,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: users.map((userId) {
//                   final displayName = state.userDisplayNames[userId] ?? userId;
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4.0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.person, size: 16),
//                         const SizedBox(width: 8),
//                         Text(displayName),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

class _ChannelState {
  final List<String> users;
  final Map<String, String> userDisplayNames;

  _ChannelState({required this.users, required this.userDisplayNames});
}

class _VoiceChannelListTile extends StatelessWidget {
  final VoiceChannel channel;

  const _VoiceChannelListTile({required this.channel});

  Stream<_ChannelState> _voiceEvents(
    HubConnection hub,
    String voiceRelayID,
    String serverId,
    String channelId,
  ) async* {
    final relayClient = await hub.voiceRelayClient(voiceRelayID);
    final resp = relayClient.watchChannel(
      WatchChannelRequest(
        requestSingle: WatchChannelRequestSingle(serverId: serverId, channelId: channelId),
      ),
    );

    await for (var event in resp) {
      final Map<String, String> userDisplayNames = {};
      for (var userId in event.usersState.userIds) {
        final user = await hub.usersRepo.getUser(userId);
        userDisplayNames[userId] = user.username;
      }

      yield _ChannelState(users: event.usersState.userIds, userDisplayNames: userDisplayNames);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _voiceEvents(
        context.hub,
        channel.voiceRelayId.first,
        channel.serverId,
        channel.channelId,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return ListTile(leading: const Icon(Icons.mic), title: CircularProgressIndicator());
        }

        final state = snapshot.data!;

        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.mic),
              title: Text(channel.name),
              trailing: IconButton(
                icon: const Icon(Icons.call_end),
                onPressed: () => context.read<VoiceBloc>().add(LeaveVoiceChannel()),
              ),
              onTap: () => context.read<VoiceBloc>().add(
                JoinVoiceChannel(
                  conn: context.read<HubConnection>(),
                  serverId: channel.serverId,
                  channelId: channel.channelId,
                  voiceRelayId: channel.voiceRelayId[0],
                ),
              ),
            ),
            if (state.users.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: SizedBox(
                  height: state.users.length * 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.users.map((userId) {
                      final displayName = state.userDisplayNames[userId] ?? userId;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const Icon(Icons.person, size: 16),
                            const SizedBox(width: 8),
                            Text(displayName),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
