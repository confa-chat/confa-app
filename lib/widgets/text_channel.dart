import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:confa/gen/proto/google/protobuf/timestamp.pb.dart';
import 'package:confa/gen/proto/confa/chat/v1/service.pbgrpc.dart';
import 'package:confa/gen/proto/confa/user/v1/user.pb.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:l/l.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';
import 'package:fixnum/fixnum.dart';
import 'package:file_selector/file_selector.dart' as file_selector;

class TextChatWidget extends StatefulWidget {
  final String serverId;
  final String channelId;

  const TextChatWidget({
    super.key,
    required this.serverId,
    required this.channelId,
  });

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
        channel: TextChannelRef(
          channelId: widget.channelId,
          serverId: widget.serverId,
        ),
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

    final channelRef = TextChannelRef(
      channelId: widget.channelId,
      serverId: widget.serverId,
    );

    newMessageHandler(StreamNewMessagesResponse event) async {
      final msg = await hub.chatClient.getMessage(
        GetMessageRequest(channel: channelRef, messageId: event.messageId),
      );

      _users[msg.message.senderId] ??= await hub.usersRepo.getUser(
        msg.message.senderId,
      );

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
            loadingBuilder: (context) => _hasReachedMax
                ? const SizedBox()
                : const Center(child: CircularProgressIndicator()),
            itemBuilder: (context, index) => MessageListTile(
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
          send: (text, attachmentIds) async {
            context.hub.chatClient.sendMessage(
              SendMessageRequest(
                channel: TextChannelRef(
                  channelId: widget.channelId,
                  serverId: widget.serverId,
                ),
                content: text,
                attachmentIds: attachmentIds,
              ),
            );
          },
          hubConnection: context.hub,
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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.message.content),
          if (widget.message.attachments.isNotEmpty)
            _messageAttachments(widget.message.attachments),
        ],
      ),
      subtitleTextStyle: Theme.of(context).textTheme.bodyLarge,
    );
  }

  void _saveFile(Attachment attachment) {
    launchUrl(context.hub.baseUri.replace(path: attachment.url));

    // TODO make downloads without a browser in future
    // FilePicker.platform
    //     .saveFile(fileName: attachment.name, dialogTitle: 'Save ${attachment.name}')
    //     .then((filePath) {
    //       if (filePath != null) {
    //         // Download the file from the URL and save it to the selected path
    //         HttpClient()
    //             .getUrl(Uri.parse(fileUrl))
    //             .then((request) {
    //               return request.close();
    //             })
    //             .then((response) {
    //               return response.pipe(File(filePath).openWrite());
    //             });
    //       }
    //     });
  }

  Widget _messageAttachments(List<Attachment> atts) {
    final attachmentsList = atts.splitByType();

    return Column(
      children: [
        if (attachmentsList.images.isNotEmpty)
          Wrap(
            children: attachmentsList.images.map((attachment) {
              final imageUrl = context.hub.baseUri
                  .replace(path: attachment.url)
                  .toString();

              return ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: Image.network(
                  imageUrl,
                  errorBuilder: (context, error, stackTrace) =>
                      const Placeholder(child: Icon(Icons.error)),
                ),
              );
            }).toList(),
          ),
        if (attachmentsList.other.isNotEmpty)
          Wrap(
            spacing: 8,
            children: attachmentsList.other.map((attachment) {
              return ActionChip(
                label: Text(attachment.name),
                avatar: const Icon(Icons.attach_file),
                onPressed: () => _saveFile(attachment),
              );
            }).toList(),
          ),
      ],
    );
  }
}

class AttachmentsList {
  List<Attachment> images = <Attachment>[];
  List<Attachment> other = <Attachment>[];
}

extension SplitImages on Iterable<Attachment> {
  AttachmentsList splitByType() {
    final attachmentsList = AttachmentsList();
    for (final element in this) {
      if (element.name.endsWith(".jpg") ||
          element.name.endsWith(".jpeg") ||
          element.name.endsWith(".png") ||
          element.name.endsWith(".webp") ||
          element.name.endsWith(".gif")) {
        attachmentsList.images.add(element);
      } else {
        attachmentsList.other.add(element);
      }
    }
    return attachmentsList;
  }
}

class MessageInput extends StatefulWidget {
  final Future<void> Function(String text, List<String> attachmentIds) send;
  final HubConnection hubConnection;

  const MessageInput({
    super.key,
    required this.send,
    required this.hubConnection,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

extension BufferedReader on Stream<Uint8List> {
  Stream<Uint8List> chunked(int chunkSize) async* {
    final reader = ChunkedStreamReader(this);
    while (true) {
      final chunk = await reader.readBytes(chunkSize);
      if (chunk.isEmpty) break;
      yield chunk;
    }
  }
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  final List<file_selector.XFile> _selectedFiles = [];
  final List<String> _uploadedAttachmentIds = [];
  bool _isUploading = false;

  Future<void> _pickFiles() async {
    try {
      // final result = await FilePicker.platform.pickFiles(
      //   allowMultiple: true,
      //   type: FileType.any,
      //   dialogTitle: 'Select file attachments',
      // );

      final results = await file_selector.openFiles();

      if (results.isNotEmpty) {
        setState(() {
          _selectedFiles.addAll(results);
        });
      }
    } catch (e) {
      // Show error to user
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error picking files: $e')));
      }
    }
  }

  Stream<UploadAttachmentRequest> _fileUploadStream(
    file_selector.XFile file,
  ) async* {
    yield UploadAttachmentRequest(info: AttachmentUploadInfo(name: file.name));
    await for (final chunk in file.openRead().chunked(1024 * 1024)) {
      yield UploadAttachmentRequest(data: chunk);
    }
  }

  Future<void> _uploadAttachments() async {
    if (_selectedFiles.isEmpty) return;

    setState(() {
      _isUploading = true;
    });

    try {
      for (final file in _selectedFiles) {
        final response = await context.hub.chatClient.uploadAttachment(
          _fileUploadStream(file),
        );
        _uploadedAttachmentIds.add(response.attachmentId);
      }
    } catch (e) {
      if (mounted) {
        l.e('Error uploading files: $e');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error uploading files: $e')));
      }
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();

    if (text.isEmpty && _selectedFiles.isEmpty) {
      return;
    }

    // Upload attachments first if any
    if (_selectedFiles.isNotEmpty) {
      await _uploadAttachments();
    }

    _controller.clear();
    await widget.send(text, _uploadedAttachmentIds);

    // Clear selected files and uploaded attachment IDs after sending
    setState(() {
      _selectedFiles.clear();
      _uploadedAttachmentIds.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(),
        if (_selectedFiles.isNotEmpty)
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedFiles.length,
              itemBuilder: (context, index) {
                final file = _selectedFiles[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Chip(
                    label: Text(file.name),
                    avatar: const Icon(Icons.attach_file),
                    onDeleted: () => _removeAttachment(index),
                  ),
                );
              },
            ),
          ),
        SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: _isUploading ? null : _pickFiles,
                tooltip: 'Attach files',
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                  ),
                  controller: _controller,
                  onSubmitted: (_) => _sendMessage(),
                  enabled: !_isUploading,
                ),
              ),
              IconButton(
                icon: _isUploading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.send),
                onPressed: _isUploading ? null : _sendMessage,
                tooltip: 'Send message',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
