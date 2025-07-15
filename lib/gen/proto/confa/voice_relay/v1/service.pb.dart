// This is a generated file - do not edit.
//
// Generated from confa/voice_relay/v1/service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'voice.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class JoinChannelRequest extends $pb.GeneratedMessage {
  factory JoinChannelRequest({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? userId,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    if (channelId != null) result.channelId = channelId;
    if (userId != null) result.userId = userId;
    return result;
  }

  JoinChannelRequest._();

  factory JoinChannelRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory JoinChannelRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinChannelRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelRequest clone() => JoinChannelRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelRequest copyWith(void Function(JoinChannelRequest) updates) => super.copyWith((message) => updates(message as JoinChannelRequest)) as JoinChannelRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChannelRequest create() => JoinChannelRequest._();
  @$core.override
  JoinChannelRequest createEmptyInstance() => create();
  static $pb.PbList<JoinChannelRequest> createRepeated() => $pb.PbList<JoinChannelRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinChannelRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinChannelRequest>(create);
  static JoinChannelRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get channelId => $_getSZ(1);
  @$pb.TagNumber(2)
  set channelId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);
}

enum JoinChannelResponse_State {
  usersState, 
  notSet
}

class JoinChannelResponse extends $pb.GeneratedMessage {
  factory JoinChannelResponse({
    UsersState? usersState,
  }) {
    final result = create();
    if (usersState != null) result.usersState = usersState;
    return result;
  }

  JoinChannelResponse._();

  factory JoinChannelResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory JoinChannelResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, JoinChannelResponse_State> _JoinChannelResponse_StateByTag = {
    1 : JoinChannelResponse_State.usersState,
    0 : JoinChannelResponse_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinChannelResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<UsersState>(1, _omitFieldNames ? '' : 'usersState', subBuilder: UsersState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelResponse clone() => JoinChannelResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelResponse copyWith(void Function(JoinChannelResponse) updates) => super.copyWith((message) => updates(message as JoinChannelResponse)) as JoinChannelResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChannelResponse create() => JoinChannelResponse._();
  @$core.override
  JoinChannelResponse createEmptyInstance() => create();
  static $pb.PbList<JoinChannelResponse> createRepeated() => $pb.PbList<JoinChannelResponse>();
  @$core.pragma('dart2js:noInline')
  static JoinChannelResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinChannelResponse>(create);
  static JoinChannelResponse? _defaultInstance;

  JoinChannelResponse_State whichState() => _JoinChannelResponse_StateByTag[$_whichOneof(0)]!;
  void clearState() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UsersState get usersState => $_getN(0);
  @$pb.TagNumber(1)
  set usersState(UsersState value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUsersState() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsersState() => $_clearField(1);
  @$pb.TagNumber(1)
  UsersState ensureUsersState() => $_ensure(0);
}

class UsersState extends $pb.GeneratedMessage {
  factory UsersState({
    $core.Iterable<$core.String>? userIds,
  }) {
    final result = create();
    if (userIds != null) result.userIds.addAll(userIds);
    return result;
  }

  UsersState._();

  factory UsersState.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UsersState.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsersState', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'userIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UsersState clone() => UsersState()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UsersState copyWith(void Function(UsersState) updates) => super.copyWith((message) => updates(message as UsersState)) as UsersState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsersState create() => UsersState._();
  @$core.override
  UsersState createEmptyInstance() => create();
  static $pb.PbList<UsersState> createRepeated() => $pb.PbList<UsersState>();
  @$core.pragma('dart2js:noInline')
  static UsersState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsersState>(create);
  static UsersState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get userIds => $_getList(0);
}

enum SpeakToChannelRequest_Request {
  voiceInfo, 
  voiceData, 
  notSet
}

class SpeakToChannelRequest extends $pb.GeneratedMessage {
  factory SpeakToChannelRequest({
    $1.VoiceInfo? voiceInfo,
    $1.VoiceData? voiceData,
  }) {
    final result = create();
    if (voiceInfo != null) result.voiceInfo = voiceInfo;
    if (voiceData != null) result.voiceData = voiceData;
    return result;
  }

  SpeakToChannelRequest._();

  factory SpeakToChannelRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SpeakToChannelRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SpeakToChannelRequest_Request> _SpeakToChannelRequest_RequestByTag = {
    1 : SpeakToChannelRequest_Request.voiceInfo,
    2 : SpeakToChannelRequest_Request.voiceData,
    0 : SpeakToChannelRequest_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpeakToChannelRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..aOM<$1.VoiceData>(2, _omitFieldNames ? '' : 'voiceData', subBuilder: $1.VoiceData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeakToChannelRequest clone() => SpeakToChannelRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeakToChannelRequest copyWith(void Function(SpeakToChannelRequest) updates) => super.copyWith((message) => updates(message as SpeakToChannelRequest)) as SpeakToChannelRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeakToChannelRequest create() => SpeakToChannelRequest._();
  @$core.override
  SpeakToChannelRequest createEmptyInstance() => create();
  static $pb.PbList<SpeakToChannelRequest> createRepeated() => $pb.PbList<SpeakToChannelRequest>();
  @$core.pragma('dart2js:noInline')
  static SpeakToChannelRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeakToChannelRequest>(create);
  static SpeakToChannelRequest? _defaultInstance;

  SpeakToChannelRequest_Request whichRequest() => _SpeakToChannelRequest_RequestByTag[$_whichOneof(0)]!;
  void clearRequest() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.VoiceInfo get voiceInfo => $_getN(0);
  @$pb.TagNumber(1)
  set voiceInfo($1.VoiceInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVoiceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.VoiceInfo ensureVoiceInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.VoiceData get voiceData => $_getN(1);
  @$pb.TagNumber(2)
  set voiceData($1.VoiceData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVoiceData() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceData() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.VoiceData ensureVoiceData() => $_ensure(1);
}

class SpeakToChannelResponse extends $pb.GeneratedMessage {
  factory SpeakToChannelResponse() => create();

  SpeakToChannelResponse._();

  factory SpeakToChannelResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SpeakToChannelResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpeakToChannelResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeakToChannelResponse clone() => SpeakToChannelResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeakToChannelResponse copyWith(void Function(SpeakToChannelResponse) updates) => super.copyWith((message) => updates(message as SpeakToChannelResponse)) as SpeakToChannelResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeakToChannelResponse create() => SpeakToChannelResponse._();
  @$core.override
  SpeakToChannelResponse createEmptyInstance() => create();
  static $pb.PbList<SpeakToChannelResponse> createRepeated() => $pb.PbList<SpeakToChannelResponse>();
  @$core.pragma('dart2js:noInline')
  static SpeakToChannelResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeakToChannelResponse>(create);
  static SpeakToChannelResponse? _defaultInstance;
}

class ListenToUserRequest extends $pb.GeneratedMessage {
  factory ListenToUserRequest({
    $1.VoiceInfo? voiceInfo,
  }) {
    final result = create();
    if (voiceInfo != null) result.voiceInfo = voiceInfo;
    return result;
  }

  ListenToUserRequest._();

  factory ListenToUserRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListenToUserRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListenToUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListenToUserRequest clone() => ListenToUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListenToUserRequest copyWith(void Function(ListenToUserRequest) updates) => super.copyWith((message) => updates(message as ListenToUserRequest)) as ListenToUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListenToUserRequest create() => ListenToUserRequest._();
  @$core.override
  ListenToUserRequest createEmptyInstance() => create();
  static $pb.PbList<ListenToUserRequest> createRepeated() => $pb.PbList<ListenToUserRequest>();
  @$core.pragma('dart2js:noInline')
  static ListenToUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListenToUserRequest>(create);
  static ListenToUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.VoiceInfo get voiceInfo => $_getN(0);
  @$pb.TagNumber(1)
  set voiceInfo($1.VoiceInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVoiceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.VoiceInfo ensureVoiceInfo() => $_ensure(0);
}

enum ListenToUserResponse_Response {
  voiceInfo, 
  voiceData, 
  notSet
}

class ListenToUserResponse extends $pb.GeneratedMessage {
  factory ListenToUserResponse({
    $1.VoiceInfo? voiceInfo,
    $1.VoiceData? voiceData,
  }) {
    final result = create();
    if (voiceInfo != null) result.voiceInfo = voiceInfo;
    if (voiceData != null) result.voiceData = voiceData;
    return result;
  }

  ListenToUserResponse._();

  factory ListenToUserResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListenToUserResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ListenToUserResponse_Response> _ListenToUserResponse_ResponseByTag = {
    1 : ListenToUserResponse_Response.voiceInfo,
    2 : ListenToUserResponse_Response.voiceData,
    0 : ListenToUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListenToUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..aOM<$1.VoiceData>(2, _omitFieldNames ? '' : 'voiceData', subBuilder: $1.VoiceData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListenToUserResponse clone() => ListenToUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListenToUserResponse copyWith(void Function(ListenToUserResponse) updates) => super.copyWith((message) => updates(message as ListenToUserResponse)) as ListenToUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListenToUserResponse create() => ListenToUserResponse._();
  @$core.override
  ListenToUserResponse createEmptyInstance() => create();
  static $pb.PbList<ListenToUserResponse> createRepeated() => $pb.PbList<ListenToUserResponse>();
  @$core.pragma('dart2js:noInline')
  static ListenToUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListenToUserResponse>(create);
  static ListenToUserResponse? _defaultInstance;

  ListenToUserResponse_Response whichResponse() => _ListenToUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.VoiceInfo get voiceInfo => $_getN(0);
  @$pb.TagNumber(1)
  set voiceInfo($1.VoiceInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVoiceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.VoiceInfo ensureVoiceInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.VoiceData get voiceData => $_getN(1);
  @$pb.TagNumber(2)
  set voiceData($1.VoiceData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVoiceData() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceData() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.VoiceData ensureVoiceData() => $_ensure(1);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
