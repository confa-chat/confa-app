import 'package:flutter/material.dart';
import 'package:konfa/gen/proto/konfa/channel/v1/channels.pb.dart';
import 'package:konfa/gen/proto/konfa/server/v1/service.pbgrpc.dart';
import 'package:konfa/repo/user.dart';
import 'package:konfa/widgets/text_channel.dart';
import 'package:konfa/widgets/voice_channel.dart';
import 'package:provider/provider.dart';

class ServerScreen extends StatefulWidget {
  final String serverID;

  const ServerScreen({super.key, required this.serverID});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  String? _selectedTextChannelID;

  late Future<List<Channel>> channels;

  @override
  void initState() {
    final serverClient = Provider.of<ServerServiceClient>(context, listen: false);
    final userRepo = Provider.of<UserRepo>(context, listen: false);

    channels = Future(() async {
      await userRepo.loadServerUsers(widget.serverID);

      final response = await serverClient.listServerChannels(
        ListServerChannelsRequest(serverId: widget.serverID),
      );
      return response.channels;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: channels,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting || ConnectionState.active || ConnectionState.none:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              break;
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final channels = snapshot.data!.toList();

          return Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200,
                  minHeight: double.infinity,
                ),
                child: _ChannelList(
                  channels: channels,
                  textChannelSelected: (id) => setState(() {
                    _selectedTextChannelID = id;
                  }),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: _selectedTextChannelID == null
                    ? const Placeholder()
                    : TextChatWidget(
                        serverId: widget.serverID,
                        channelId: _selectedTextChannelID!,
                      ),
              )
            ],
          );
        });
  }
}

class _ChannelList extends StatefulWidget {
  final void Function(String) textChannelSelected;
  final List<Channel> channels;

  const _ChannelList({super.key, required this.channels, required this.textChannelSelected});

  @override
  State<_ChannelList> createState() => _ChannelListState();
}

class _ChannelListState extends State<_ChannelList> {
  String? selectedTextChannelID;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.channels
            .map<Widget?>((channel) {
              if (channel.hasTextChannel()) {
                return ListTile(
                    leading: const Icon(Icons.short_text),
                    selected: channel.textChannel.channelId == selectedTextChannelID,
                    title: Text(channel.textChannel.name),
                    onTap: () {
                      widget.textChannelSelected(channel.textChannel.channelId);
                      setState(() {
                        selectedTextChannelID = channel.textChannel.channelId;
                      });
                    });
              } else if (channel.hasVoiceChannel()) {
                return VoiceChannelListTile(channel: channel.voiceChannel);
              }

              return null;
            })
            .nonNulls
            .toList(),
      ),
    );
  }
}
