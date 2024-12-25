import 'package:flutter/material.dart';
import 'package:konfa/gen/proto/konfa/channel/v1/channels.pb.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';
import 'package:provider/provider.dart';

class VoiceChannelListTile extends StatefulWidget {
  final VoiceChannel channel;

  const VoiceChannelListTile({super.key, required this.channel});

  @override
  State<VoiceChannelListTile> createState() => _VoiceChannelState();
}

class _VoiceChannelState extends State<VoiceChannelListTile> {
  SubscribeChannelStateResponse? channelState;

  @override
  void initState() {
    final voiceService = Provider.of<VoiceServiceClient>(context, listen: false);

    voiceService
        .subscribeChannelState(SubscribeChannelStateRequest(
      channelId: widget.channel.channelId,
      serverId: widget.channel.serverId,
    ))
        .listen((event) {
      setState(() {
        channelState = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final channelState = this.channelState;

    if (channelState == null || channelState.users.isEmpty) {
      return ListTile(
        leading: const Icon(Icons.mic),
        title: Text(widget.channel.name),
      );
    }

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
                children: channelState.users.map((e) => ListTile(title: Text(e))).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
