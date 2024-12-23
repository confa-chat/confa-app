import 'dart:async';

import 'package:flutter/material.dart';
import 'package:konfa/gen/proto/google/protobuf/timestamp.pb.dart';
import 'package:konfa/gen/proto/konfa/chat/v1/service.pbgrpc.dart';
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
  final List<Message> _messages = [];
  late final StreamSubscription<void> updateSubscription;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    late Timestamp lastMessageTimestamp;

    if (_messages.isNotEmpty) {
      lastMessageTimestamp = _messages.last.timestamp;
    } else {
      final now = DateTime.now();
      lastMessageTimestamp = Timestamp(
        seconds: Int64(now.microsecondsSinceEpoch ~/ 1000),
        nanos: now.millisecond % 1000 * 1000,
      );
    }

    final chatService = Provider.of<ChatServiceClient>(context, listen: false);

    final msgs = await chatService.getMessageHistory(
      GetMessageHistoryRequest(
        channel: TextChannelRef(
          channelId: widget.channelId,
          serverId: widget.serverId,
        ),
        from: lastMessageTimestamp,
        count: 20,
      ),
    );

    setState(() {
      _isLoading = false;
      _messages.addAll(msgs.messages);
    });
  }

  @override
  void initState() {
    final chatService = Provider.of<ChatServiceClient>(context, listen: false);
    final channelRef = TextChannelRef(
      channelId: widget.channelId,
      serverId: widget.serverId,
    );

    newMessageHandler(StreamNewMessagesResponse event) async {
      final msg = await chatService.getMessage(
        GetMessageRequest(
          channel: channelRef,
          messageId: event.messageId,
        ),
      );

      setState(() {
        _messages.insert(0, msg.message);
      });
    }

    updateSubscription = chatService
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
            itemBuilder: (context, index) => ListTile(
              title: Text(_messages[index].senderId),
              titleTextStyle: Theme.of(context).textTheme.labelSmall,
              subtitle: Text(_messages[index].content),
              subtitleTextStyle: Theme.of(context).textTheme.bodyLarge,
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
            Provider.of<ChatServiceClient>(context, listen: false).sendMessage(
              SendMessageRequest(
                channel: TextChannelRef(
                  channelId: widget.channelId,
                  serverId: widget.serverId,
                ),
                content: text,
              ),
            );
          },
        ),
      ],
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
    await widget.send(_controller.text);
    setState(() {
      _controller.text = "";
    });
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Message',
              ),
              controller: _controller,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
