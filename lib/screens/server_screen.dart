import 'package:flutter/material.dart';
import 'package:konfa/gen/proto/konfa/channel/v1/channels.pb.dart';
import 'package:konfa/gen/proto/konfa/server/v1/service.pb.dart';
import 'package:konfa/services/connection_manager.dart';
import 'package:konfa/widgets/text_channel.dart';
import 'package:konfa/widgets/voice_channel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'server_screen.g.dart';

@TypedGoRoute<ServerScreenRoute>(path: '/hub/:hubID/server/:serverID')
@immutable
class ServerScreenRoute extends GoRouteData {
  final String hubID;
  final String serverID;

  const ServerScreenRoute({required this.hubID, required this.serverID});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ServerScreen(hubID: hubID, serverID: serverID);
  }
}

class ServerScreen extends StatefulWidget {
  final String hubID;
  final String serverID;

  const ServerScreen({super.key, required this.hubID, required this.serverID});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  String? _selectedTextChannelID;
  late Future<List<Channel>> channels;

  @override
  void initState() {
    super.initState();

    channels = context
        .getHub(widget.hubID)
        .serverClient
        .listServerChannels(ListServerChannelsRequest(serverId: widget.serverID))
        .then((p0) {
          return p0.channels;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<HubConnection>.value(
      value: context.getHub(widget.hubID),
      child: Scaffold(
        appBar: AppBar(title: Text('Server ${widget.serverID}')),
        body: FutureBuilder(
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
                    textChannelSelected:
                        (id) => setState(() {
                          _selectedTextChannelID = id;
                        }),
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child:
                      _selectedTextChannelID == null
                          ? const Placeholder()
                          : TextChatWidget(
                            serverId: widget.serverID,
                            channelId: _selectedTextChannelID!,
                          ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ChannelList extends StatefulWidget {
  final void Function(String) textChannelSelected;
  final List<Channel> channels;

  const _ChannelList({required this.channels, required this.textChannelSelected});

  @override
  State<_ChannelList> createState() => _ChannelListState();
}

class _ChannelListState extends State<_ChannelList> {
  String? selectedTextChannelID;
  String? activeVoiceChannelID;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            widget.channels
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
                      },
                    );
                  } else if (channel.hasVoiceChannel()) {
                    if (channel.voiceChannel.channelId == activeVoiceChannelID) {
                      return ActiveVoiceChannelWidget(channel: channel.voiceChannel);
                    }
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
