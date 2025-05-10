import 'dart:async';

import 'package:flutter/material.dart';
import 'package:konfa/gen/proto/google/protobuf/timestamp.pb.dart';
import 'package:konfa/gen/proto/konfa/chat/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/user/v1/user.pb.dart';
import 'package:konfa/repo/user.dart';
import 'package:konfa/services/connection_manager.dart';
import 'package:provider/provider.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';
import 'package:fixnum/fixnum.dart';

class TextChatWidget extends StatefulWidget {
  final String serverId;
  final String channelId;

  const TextChatWidget({super.key, required this.serverId, required this.channelId});

  @override
  State<TextChatWidget> createState() => _TextChatWidgetState();
}

class _TextChatWidgetState extends State<TextChatWidget> {
  bool _isLoading = false;
  bool _hasReachedMax = false;
  final _users = <String, User>{};
  final List<Message> _messages = [];
  late final StreamSubscription<void> updateSubscription;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    late Timestamp lastMessageTimestamp;

    final usersRepo = context.hub.usersRepo;

    if (_messages.isNotEmpty) {
      lastMessageTimestamp = _messages.last.timestamp;
    } else {
      final now = DateTime.now();
      lastMessageTimestamp = Timestamp(
        seconds: Int64(now.millisecondsSinceEpoch ~/ 1000),
        nanos: now.millisecond % 1000 * 1000,
      );
    }

    final msgs = await context.hub.chatClient.getMessageHistory(
      GetMessageHistoryRequest(
        channel: TextChannelRef(channelId: widget.channelId, serverId: widget.serverId),
        from: lastMessageTimestamp,
        count: 20,
      ),
    );

    for (final msg in msgs.messages) {
      _users[msg.senderId] ??= await usersRepo.getUser(msg.senderId);
    }

    setState(() {
      if (msgs.messages.isEmpty) {
        _hasReachedMax = true;
        return;
      }

      _isLoading = false;
      _messages.addAll(msgs.messages);
    });
  }

  @override
  void initState() {
    final hub = context.hub;

    final channelRef = TextChannelRef(channelId: widget.channelId, serverId: widget.serverId);

    newMessageHandler(StreamNewMessagesResponse event) async {
      final msg = await hub.chatClient.getMessage(
        GetMessageRequest(channel: channelRef, messageId: event.messageId),
      );

      _users[msg.message.senderId] ??= await hub.usersRepo.getUser(msg.message.senderId);

      setState(() {
        _messages.insert(0, msg.message);
      });
    }

    updateSubscription = hub.chatClient
        .streamNewMessages(StreamNewMessagesRequest(channel: channelRef))
        .listen(newMessageHandler);

    super.initState();
  }

  @override
  void dispose() {
    updateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: InfiniteList(
            itemCount: _messages.length,
            onFetchData: _fetchData,
            isLoading: _isLoading,
            reverse: true,
            hasReachedMax: _hasReachedMax,
            loadingBuilder:
                (context) =>
                    _hasReachedMax
                        ? const SizedBox()
                        : const Center(child: CircularProgressIndicator()),
            itemBuilder:
                (context, index) => MessageListTile(
                  user: _users[_messages[index].senderId]!,
                  message: _messages[index],
                ),
          ),
          // child: ListView.builder(
          //   reverse: true,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text(_messages[index].senderId),
          //       subtitle: Text(_messages[index].content),
          //     );
          //   },
          // ),
        ),
        MessageInput(
          send: (text) async {
            context.hub.chatClient.sendMessage(
              SendMessageRequest(
                channel: TextChannelRef(channelId: widget.channelId, serverId: widget.serverId),
                content: text,
              ),
            );
          },
        ),
      ],
    );
  }
}

class MessageListTile extends StatefulWidget {
  final Message message;
  final User user;

  const MessageListTile({super.key, required this.message, required this.user});

  @override
  State<MessageListTile> createState() => _MessageListTileState();
}

class _MessageListTileState extends State<MessageListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.user.username),
      titleTextStyle: Theme.of(context).textTheme.labelSmall,
      subtitle: Text(widget.message.content),
      subtitleTextStyle: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class MessageInput extends StatefulWidget {
  final Future<void> Function(String text) send;

  const MessageInput({super.key, required this.send});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();

    if (text.isEmpty) {
      return;
    }

    _controller.clear();
    await widget.send(text);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Message'),
              controller: _controller,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(icon: const Icon(Icons.send), onPressed: _sendMessage),
        ],
      ),
    );
  }
}
