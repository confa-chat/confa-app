//
//  Generated code. Do not modify.
//  source: konfa/chat/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/timestamp.pb.dart' as $3;

class TextChannelRef extends $pb.GeneratedMessage {
  factory TextChannelRef({
    $core.String? serverId,
    $core.String? channelId,
  }) {
    final $result = create();
    if (serverId != null) {
      $result.serverId = serverId;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    return $result;
  }
  TextChannelRef._() : super();
  factory TextChannelRef.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextChannelRef.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextChannelRef', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextChannelRef clone() => TextChannelRef()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextChannelRef copyWith(void Function(TextChannelRef) updates) => super.copyWith((message) => updates(message as TextChannelRef)) as TextChannelRef;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextChannelRef create() => TextChannelRef._();
  TextChannelRef createEmptyInstance() => create();
  static $pb.PbList<TextChannelRef> createRepeated() => $pb.PbList<TextChannelRef>();
  @$core.pragma('dart2js:noInline')
  static TextChannelRef getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextChannelRef>(create);
  static TextChannelRef? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get channelId => $_getSZ(1);
  @$pb.TagNumber(2)
  set channelId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);
}

class SendMessageRequest extends $pb.GeneratedMessage {
  factory SendMessageRequest({
    TextChannelRef? channel,
    $core.String? content,
    $core.Iterable<$core.String>? attachmentIds,
  }) {
    final $result = create();
    if (channel != null) {
      $result.channel = channel;
    }
    if (content != null) {
      $result.content = content;
    }
    if (attachmentIds != null) {
      $result.attachmentIds.addAll(attachmentIds);
    }
    return $result;
  }
  SendMessageRequest._() : super();
  factory SendMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOM<TextChannelRef>(1, _omitFieldNames ? '' : 'channel', subBuilder: TextChannelRef.create)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..pPS(3, _omitFieldNames ? '' : 'attachmentIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMessageRequest clone() => SendMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMessageRequest copyWith(void Function(SendMessageRequest) updates) => super.copyWith((message) => updates(message as SendMessageRequest)) as SendMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMessageRequest create() => SendMessageRequest._();
  SendMessageRequest createEmptyInstance() => create();
  static $pb.PbList<SendMessageRequest> createRepeated() => $pb.PbList<SendMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static SendMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessageRequest>(create);
  static SendMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TextChannelRef get channel => $_getN(0);
  @$pb.TagNumber(1)
  set channel(TextChannelRef v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => clearField(1);
  @$pb.TagNumber(1)
  TextChannelRef ensureChannel() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get attachmentIds => $_getList(2);
}

class SendMessageResponse extends $pb.GeneratedMessage {
  factory SendMessageResponse({
    $core.String? messageId,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    return $result;
  }
  SendMessageResponse._() : super();
  factory SendMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMessageResponse clone() => SendMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMessageResponse copyWith(void Function(SendMessageResponse) updates) => super.copyWith((message) => updates(message as SendMessageResponse)) as SendMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMessageResponse create() => SendMessageResponse._();
  SendMessageResponse createEmptyInstance() => create();
  static $pb.PbList<SendMessageResponse> createRepeated() => $pb.PbList<SendMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static SendMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessageResponse>(create);
  static SendMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);
}

class Message extends $pb.GeneratedMessage {
  factory Message({
    $core.String? messageId,
    $core.String? senderId,
    $core.String? content,
    $3.Timestamp? timestamp,
    $core.Iterable<Attachment>? attachments,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (senderId != null) {
      $result.senderId = senderId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (attachments != null) {
      $result.attachments.addAll(attachments);
    }
    return $result;
  }
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(4, _omitFieldNames ? '' : 'senderId')
    ..aOS(5, _omitFieldNames ? '' : 'content')
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'timestamp', subBuilder: $3.Timestamp.create)
    ..pc<Attachment>(7, _omitFieldNames ? '' : 'attachments', $pb.PbFieldType.PM, subBuilder: Attachment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(4)
  $core.String get senderId => $_getSZ(1);
  @$pb.TagNumber(4)
  set senderId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasSenderId() => $_has(1);
  @$pb.TagNumber(4)
  void clearSenderId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(5)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);

  @$pb.TagNumber(6)
  $3.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(6)
  set timestamp($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(6)
  void clearTimestamp() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureTimestamp() => $_ensure(3);

  @$pb.TagNumber(7)
  $core.List<Attachment> get attachments => $_getList(4);
}

class Attachment extends $pb.GeneratedMessage {
  factory Attachment({
    $core.String? attachmentId,
    $core.String? name,
    $core.String? url,
  }) {
    final $result = create();
    if (attachmentId != null) {
      $result.attachmentId = attachmentId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  Attachment._() : super();
  factory Attachment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Attachment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Attachment', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'attachmentId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Attachment clone() => Attachment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Attachment copyWith(void Function(Attachment) updates) => super.copyWith((message) => updates(message as Attachment)) as Attachment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Attachment create() => Attachment._();
  Attachment createEmptyInstance() => create();
  static $pb.PbList<Attachment> createRepeated() => $pb.PbList<Attachment>();
  @$core.pragma('dart2js:noInline')
  static Attachment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Attachment>(create);
  static Attachment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get attachmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set attachmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAttachmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttachmentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);
}

class GetMessageHistoryRequest extends $pb.GeneratedMessage {
  factory GetMessageHistoryRequest({
    TextChannelRef? channel,
    $3.Timestamp? from,
    $core.int? count,
  }) {
    final $result = create();
    if (channel != null) {
      $result.channel = channel;
    }
    if (from != null) {
      $result.from = from;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  GetMessageHistoryRequest._() : super();
  factory GetMessageHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMessageHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMessageHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOM<TextChannelRef>(1, _omitFieldNames ? '' : 'channel', subBuilder: TextChannelRef.create)
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'from', subBuilder: $3.Timestamp.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMessageHistoryRequest clone() => GetMessageHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMessageHistoryRequest copyWith(void Function(GetMessageHistoryRequest) updates) => super.copyWith((message) => updates(message as GetMessageHistoryRequest)) as GetMessageHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMessageHistoryRequest create() => GetMessageHistoryRequest._();
  GetMessageHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetMessageHistoryRequest> createRepeated() => $pb.PbList<GetMessageHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMessageHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMessageHistoryRequest>(create);
  static GetMessageHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TextChannelRef get channel => $_getN(0);
  @$pb.TagNumber(1)
  set channel(TextChannelRef v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => clearField(1);
  @$pb.TagNumber(1)
  TextChannelRef ensureChannel() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.Timestamp get from => $_getN(1);
  @$pb.TagNumber(2)
  set from($3.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureFrom() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);
}

class GetMessageHistoryResponse extends $pb.GeneratedMessage {
  factory GetMessageHistoryResponse({
    $core.Iterable<Message>? messages,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    return $result;
  }
  GetMessageHistoryResponse._() : super();
  factory GetMessageHistoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMessageHistoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMessageHistoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..pc<Message>(1, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMessageHistoryResponse clone() => GetMessageHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMessageHistoryResponse copyWith(void Function(GetMessageHistoryResponse) updates) => super.copyWith((message) => updates(message as GetMessageHistoryResponse)) as GetMessageHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMessageHistoryResponse create() => GetMessageHistoryResponse._();
  GetMessageHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetMessageHistoryResponse> createRepeated() => $pb.PbList<GetMessageHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMessageHistoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMessageHistoryResponse>(create);
  static GetMessageHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Message> get messages => $_getList(0);
}

class GetMessageRequest extends $pb.GeneratedMessage {
  factory GetMessageRequest({
    TextChannelRef? channel,
    $core.String? messageId,
  }) {
    final $result = create();
    if (channel != null) {
      $result.channel = channel;
    }
    if (messageId != null) {
      $result.messageId = messageId;
    }
    return $result;
  }
  GetMessageRequest._() : super();
  factory GetMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOM<TextChannelRef>(1, _omitFieldNames ? '' : 'channel', subBuilder: TextChannelRef.create)
    ..aOS(2, _omitFieldNames ? '' : 'messageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMessageRequest clone() => GetMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMessageRequest copyWith(void Function(GetMessageRequest) updates) => super.copyWith((message) => updates(message as GetMessageRequest)) as GetMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMessageRequest create() => GetMessageRequest._();
  GetMessageRequest createEmptyInstance() => create();
  static $pb.PbList<GetMessageRequest> createRepeated() => $pb.PbList<GetMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMessageRequest>(create);
  static GetMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TextChannelRef get channel => $_getN(0);
  @$pb.TagNumber(1)
  set channel(TextChannelRef v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => clearField(1);
  @$pb.TagNumber(1)
  TextChannelRef ensureChannel() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get messageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageId() => clearField(2);
}

class GetMessageResponse extends $pb.GeneratedMessage {
  factory GetMessageResponse({
    Message? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  GetMessageResponse._() : super();
  factory GetMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOM<Message>(1, _omitFieldNames ? '' : 'message', subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMessageResponse clone() => GetMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMessageResponse copyWith(void Function(GetMessageResponse) updates) => super.copyWith((message) => updates(message as GetMessageResponse)) as GetMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMessageResponse create() => GetMessageResponse._();
  GetMessageResponse createEmptyInstance() => create();
  static $pb.PbList<GetMessageResponse> createRepeated() => $pb.PbList<GetMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMessageResponse>(create);
  static GetMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);
}

class StreamNewMessagesRequest extends $pb.GeneratedMessage {
  factory StreamNewMessagesRequest({
    TextChannelRef? channel,
  }) {
    final $result = create();
    if (channel != null) {
      $result.channel = channel;
    }
    return $result;
  }
  StreamNewMessagesRequest._() : super();
  factory StreamNewMessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamNewMessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamNewMessagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOM<TextChannelRef>(1, _omitFieldNames ? '' : 'channel', subBuilder: TextChannelRef.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamNewMessagesRequest clone() => StreamNewMessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamNewMessagesRequest copyWith(void Function(StreamNewMessagesRequest) updates) => super.copyWith((message) => updates(message as StreamNewMessagesRequest)) as StreamNewMessagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamNewMessagesRequest create() => StreamNewMessagesRequest._();
  StreamNewMessagesRequest createEmptyInstance() => create();
  static $pb.PbList<StreamNewMessagesRequest> createRepeated() => $pb.PbList<StreamNewMessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamNewMessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamNewMessagesRequest>(create);
  static StreamNewMessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TextChannelRef get channel => $_getN(0);
  @$pb.TagNumber(1)
  set channel(TextChannelRef v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => clearField(1);
  @$pb.TagNumber(1)
  TextChannelRef ensureChannel() => $_ensure(0);
}

class StreamNewMessagesResponse extends $pb.GeneratedMessage {
  factory StreamNewMessagesResponse({
    $core.String? messageId,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    return $result;
  }
  StreamNewMessagesResponse._() : super();
  factory StreamNewMessagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamNewMessagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamNewMessagesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamNewMessagesResponse clone() => StreamNewMessagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamNewMessagesResponse copyWith(void Function(StreamNewMessagesResponse) updates) => super.copyWith((message) => updates(message as StreamNewMessagesResponse)) as StreamNewMessagesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamNewMessagesResponse create() => StreamNewMessagesResponse._();
  StreamNewMessagesResponse createEmptyInstance() => create();
  static $pb.PbList<StreamNewMessagesResponse> createRepeated() => $pb.PbList<StreamNewMessagesResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamNewMessagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamNewMessagesResponse>(create);
  static StreamNewMessagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);
}

enum UploadAttachmentRequest_Payload {
  info, 
  data, 
  notSet
}

class UploadAttachmentRequest extends $pb.GeneratedMessage {
  factory UploadAttachmentRequest({
    AttachmentUploadInfo? info,
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (info != null) {
      $result.info = info;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  UploadAttachmentRequest._() : super();
  factory UploadAttachmentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadAttachmentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UploadAttachmentRequest_Payload> _UploadAttachmentRequest_PayloadByTag = {
    1 : UploadAttachmentRequest_Payload.info,
    2 : UploadAttachmentRequest_Payload.data,
    0 : UploadAttachmentRequest_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadAttachmentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AttachmentUploadInfo>(1, _omitFieldNames ? '' : 'info', subBuilder: AttachmentUploadInfo.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadAttachmentRequest clone() => UploadAttachmentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadAttachmentRequest copyWith(void Function(UploadAttachmentRequest) updates) => super.copyWith((message) => updates(message as UploadAttachmentRequest)) as UploadAttachmentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadAttachmentRequest create() => UploadAttachmentRequest._();
  UploadAttachmentRequest createEmptyInstance() => create();
  static $pb.PbList<UploadAttachmentRequest> createRepeated() => $pb.PbList<UploadAttachmentRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadAttachmentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadAttachmentRequest>(create);
  static UploadAttachmentRequest? _defaultInstance;

  UploadAttachmentRequest_Payload whichPayload() => _UploadAttachmentRequest_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AttachmentUploadInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(AttachmentUploadInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  AttachmentUploadInfo ensureInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class AttachmentUploadInfo extends $pb.GeneratedMessage {
  factory AttachmentUploadInfo({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  AttachmentUploadInfo._() : super();
  factory AttachmentUploadInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttachmentUploadInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AttachmentUploadInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttachmentUploadInfo clone() => AttachmentUploadInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttachmentUploadInfo copyWith(void Function(AttachmentUploadInfo) updates) => super.copyWith((message) => updates(message as AttachmentUploadInfo)) as AttachmentUploadInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttachmentUploadInfo create() => AttachmentUploadInfo._();
  AttachmentUploadInfo createEmptyInstance() => create();
  static $pb.PbList<AttachmentUploadInfo> createRepeated() => $pb.PbList<AttachmentUploadInfo>();
  @$core.pragma('dart2js:noInline')
  static AttachmentUploadInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttachmentUploadInfo>(create);
  static AttachmentUploadInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class UploadAttachmentResponse extends $pb.GeneratedMessage {
  factory UploadAttachmentResponse({
    $core.String? attachmentId,
  }) {
    final $result = create();
    if (attachmentId != null) {
      $result.attachmentId = attachmentId;
    }
    return $result;
  }
  UploadAttachmentResponse._() : super();
  factory UploadAttachmentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadAttachmentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadAttachmentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'attachmentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadAttachmentResponse clone() => UploadAttachmentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadAttachmentResponse copyWith(void Function(UploadAttachmentResponse) updates) => super.copyWith((message) => updates(message as UploadAttachmentResponse)) as UploadAttachmentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadAttachmentResponse create() => UploadAttachmentResponse._();
  UploadAttachmentResponse createEmptyInstance() => create();
  static $pb.PbList<UploadAttachmentResponse> createRepeated() => $pb.PbList<UploadAttachmentResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadAttachmentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadAttachmentResponse>(create);
  static UploadAttachmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get attachmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set attachmentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAttachmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttachmentId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
