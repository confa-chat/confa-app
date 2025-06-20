import 'package:flutter/material.dart';
import 'package:confa/gen/proto/confa/channel/v1/channels.pb.dart';
import 'package:confa/gen/proto/confa/server/v1/service.pb.dart';
import 'package:confa/gen/proto/confa/user/v1/user.pb.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:confa/widgets/loading.dart';
import 'package:confa/widgets/text_channel.dart';
import 'package:confa/widgets/user_profile.dart';
import 'package:confa/widgets/voice_channel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'server_screen.g.dart';

@TypedGoRoute<ServerScreenRoute>(path: '/hub/:hubID/server/:serverID')
@immutable
class ServerScreenRoute extends GoRouteData with _$ServerScreenRoute {
  final String hubID;
  final String serverID;

  const ServerScreenRoute({required this.hubID, required this.serverID});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoadingBuilder(
      future: context.manager.getHubConnection(hubID),
      builder: (context, hub) {
        return Provider.value(
          value: hub,
          child: ServerScreen(hubID: hubID, serverID: serverID),
        );
      },
    );
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
  late Future<User> currentUser;

  late final serverInfoFuture = (channels, currentUser).wait;

  @override
  void initState() {
    super.initState();

    channels = context.hub.serverClient
        .listChannels(ListChannelsRequest(serverId: widget.serverID))
        .then((p0) {
          return p0.channels;
        });

    currentUser = context.hub.usersRepo.currentUser();
  }

  Drawer _buildLeftDrawer(List<Channel> channels, User user) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _ChannelList(
                channels: channels,
                textChannelSelected: (id) => setState(() {
                  _selectedTextChannelID = id;
                }),
              ),
            ),
            // User profile at the bottom
            SizedBox(
              height: 80,
              child: Card(
                margin: const EdgeInsets.all(8),
                child: UserProfileWidget(
                  user: user,
                  status: UserStatus.online,
                  onTap: () {
                    // TODO: Add user settings or profile actions
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingBuilder(
      future: serverInfoFuture,
      builder: (context, data) {
        return _ServerScreenScaffold(
          appBar: AppBar(title: Text('Server ${widget.serverID}')),
          leftDrawer: _buildLeftDrawer(data.$1, data.$2),
          centralPanel: _selectedTextChannelID != null
              ? TextChatWidget(serverId: widget.serverID, channelId: _selectedTextChannelID!)
              : Placeholder(),
        );
      },
    );
  }
}

// Adapt server screen for different layouts
class _ServerScreenScaffold extends StatelessWidget {
  final AppBar appBar;
  final Drawer leftDrawer;
  final Widget centralPanel;

  const _ServerScreenScaffold({
    super.key,
    required this.appBar,
    required this.leftDrawer,
    required this.centralPanel,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile layout
          return Scaffold(appBar: appBar, drawer: leftDrawer, body: centralPanel);
        } else {
          // Desktop layout
          return Scaffold(
            appBar: appBar,
            body: Row(
              children: [
                SizedBox(width: 300, child: leftDrawer),
                Expanded(child: centralPanel),
              ],
            ),
          );
        }
      },
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
                  },
                );
              } else if (channel.hasVoiceChannel()) {
                return VoiceChannelWidget(channel: channel.voiceChannel);
              }
              return null;
            })
            .nonNulls
            .toList(),
      ),
    );
  }
}
