import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfa/bloc/voice_bloc.dart';
import 'package:konfa/gen/proto/konfa/channel/v1/channels.pb.dart';
import 'package:konfa/services/connection_manager.dart';

class VoiceChannelListTile extends StatelessWidget {
  final VoiceChannel channel;

  const VoiceChannelListTile({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceBloc, VoiceState>(
      builder: (context, state) {
        final bool isActive =
            state is VoiceChannelConnected &&
            state.channelId == channel.channelId &&
            state.serverId == channel.serverId;

        return ListTile(
          leading: const Icon(Icons.mic),
          title: Text(channel.name),
          subtitle:
              channel.hasVoiceRelayId()
                  ? Text('Relay: ${channel.voiceRelayId}', style: TextStyle(fontSize: 10))
                  : null,
          selected: isActive,
          onTap:
              isActive
                  ? () => context.read<VoiceBloc>().add(LeaveVoiceChannel())
                  : () => context.read<VoiceBloc>().add(
                    JoinVoiceChannel(
                      conn: context.read<HubConnection>(),
                      serverId: channel.serverId,
                      channelId: channel.channelId,
                      voiceRelayId: channel.voiceRelayId,
                    ),
                  ),
        );
      },
    );
  }
}

class ActiveVoiceChannelWidget extends StatelessWidget {
  final VoiceChannel channel;

  const ActiveVoiceChannelWidget({super.key, required this.channel});

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

        if (state is VoiceChannelConnected &&
            state.channelId == channel.channelId &&
            state.serverId == channel.serverId) {
          final users = state.usersState.userIds;

          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.mic),
                title: Text(channel.name),
                subtitle:
                    channel.hasVoiceRelayId()
                        ? Text('Relay: ${channel.voiceRelayId}', style: TextStyle(fontSize: 10))
                        : null,
                trailing: IconButton(
                  icon: const Icon(Icons.call_end),
                  onPressed: () => context.read<VoiceBloc>().add(LeaveVoiceChannel()),
                ),
              ),
              if (users.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.people),
                    const SizedBox(width: 8),
                    Text('${users.length} users connected'),
                  ],
                ),
              if (users.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: users.length * 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          users.map((userId) {
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
        }

        return ListTile(
          leading: const Icon(Icons.mic),
          title: Text(channel.name),
          trailing: const Icon(Icons.error),
        );
      },
    );
  }
}
