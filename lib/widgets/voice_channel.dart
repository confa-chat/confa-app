import 'package:flutter/material.dart';
import 'package:konfa/gen/proto/konfa/channel/v1/channels.pb.dart';
import 'package:konfa/repo/user.dart';
import 'package:konfa/voice/service.dart';
import 'package:provider/provider.dart';

class VoiceChannelListTile extends StatefulWidget {
  final VoiceChannel channel;
  final void Function()? onJoin;

  const VoiceChannelListTile({super.key, required this.channel, this.onJoin});

  @override
  State<VoiceChannelListTile> createState() => _VoiceChannelState();
}

class _VoiceChannelState extends State<VoiceChannelListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.mic),
      title: Text(widget.channel.name),
      onTap: widget.onJoin,
    );

    // if (users == null || users.isEmpty) {
    //   return ListTile(
    //     leading: const Icon(Icons.mic),
    //     title: Text(widget.channel.name),
    //   );
    // }

    // return Column(
    //   children: [
    //     ListTile(
    //       leading: const Icon(Icons.mic),
    //       title: Text(widget.channel.name),
    //     ),
    //     Row(
    //       children: [
    //         const Spacer(flex: 1),
    //         Flexible(
    //           flex: 3,
    //           child: Column(
    //             children: users.map((e) => ListTile(title: Text(e))).toList(),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}

class ActiveVoiceChannelListTile extends StatefulWidget {
  final VoiceChannel channel;
  const ActiveVoiceChannelListTile({super.key, required this.channel});

  @override
  State<ActiveVoiceChannelListTile> createState() => _ActiveVoiceChannelListTileState();
}

class _ActiveVoiceChannelListTileState extends State<ActiveVoiceChannelListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.mic),
          title: Text(widget.channel.name),
        ),
        StreamBuilder(
          stream: Provider.of<VoiceService>(context).joinChannel(
            widget.channel.serverId,
            widget.channel.channelId,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              throw snapshot.error!;
              // return const Text('Error');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final users = snapshot.data!.userIds;

            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.mic),
                  title: Text(widget.channel.name),
                ),
                Row(
                  children: [
                    const Spacer(flex: 1),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: users
                            .map((userID) => ListTile(
                                  title: FutureBuilder(
                                    future: Provider.of<UsersRepo>(context).getUser(userID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      }

                                      if (snapshot.hasError) {
                                        throw snapshot.error!;
                                        // return const Text('Error');
                                      }

                                      final user = snapshot.data!;

                                      return Text(user.username);
                                    },
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
