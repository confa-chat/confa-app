//
//  Generated code. Do not modify.
//  source: konfa/voice_relay/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'voice.pb.dart' as $1;

class JoinChannelRequest extends $pb.GeneratedMessage {
  factory JoinChannelRequest({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? userId,
  }) {
    final $result = create();
    if (serverId != null) {
      $result.serverId = serverId;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  JoinChannelRequest._() : super();
  factory JoinChannelRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinChannelRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinChannelRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice_relay.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinChannelRequest clone() => JoinChannelRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinChannelRequest copyWith(void Function(JoinChannelRequest) updates) => super.copyWith((message) => updates(message as JoinChannelRequest)) as JoinChannelRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChannelRequest create() => JoinChannelRequest._();
  JoinChannelRequest createEmptyInstance() => create();
  static $pb.PbList<JoinChannelRequest> createRepeated() => $pb.PbList<JoinChannelRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinChannelRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinChannelRequest>(create);
  static JoinChannelRequest? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);
}

enum JoinChannelResponse_State {
  usersState, 
  notSet
}

class JoinChannelResponse extends $pb.GeneratedMessage {
  factory JoinChannelResponse({
    UsersState? usersState,
  }) {
    final $result = create();
    if (usersState != null) {
      $result.usersState = usersState;
    }
    return $result;
  }
  JoinChannelResponse._() : super();
  factory JoinChannelResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinChannelResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, JoinChannelResponse_State> _JoinChannelResponse_StateByTag = {
    1 : JoinChannelResponse_State.usersState,
    0 : JoinChannelResponse_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinChannelResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice_relay.v1'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<UsersState>(1, _omitFieldNames ? '' : 'usersState', subBuilder: UsersState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinChannelResponse clone() => JoinChannelResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinChannelResponse copyWith(void Function(JoinChannelResponse) updates) => super.copyWith((message) => updates(message as JoinChannelResponse)) as JoinChannelResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChannelResponse create() => JoinChannelResponse._();
  JoinChannelResponse createEmptyInstance() => create();
  static $pb.PbList<JoinChannelResponse> createRepeated() => $pb.PbList<JoinChannelResponse>();
  @$core.pragma('dart2js:noInline')
  static JoinChannelResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinChannelResponse>(create);
  static JoinChannelResponse? _defaultInstance;

  JoinChannelResponse_State whichState() => _JoinChannelResponse_StateByTag[$_whichOneof(0)]!;
  void clearState() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UsersState get usersState => $_getN(0);
  @$pb.TagNumber(1)
  set usersState(UsersState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsersState() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsersState() => clearField(1);
  @$pb.TagNumber(1)
  UsersState ensureUsersState() => $_ensure(0);
}

class UsersState extends $pb.GeneratedMessage {
  factory UsersState({
    $core.Iterable<$core.String>? userIds,
  }) {
    final $result = create();
    if (userIds != null) {
      $result.userIds.addAll(userIds);
    }
    return $result;
  }
  UsersState._() : super();
  factory UsersState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsersState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsersState', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice_relay.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'userIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsersState clone() => UsersState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsersState copyWith(void Function(UsersState) updates) => super.copyWith((message) => updates(message as UsersState)) as UsersState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsersState create() => UsersState._();
  UsersState createEmptyInstance() => create();
  static $pb.PbList<UsersState> createRepeated() => $pb.PbList<UsersState>();
  @$core.pragma('dart2js:noInline')
  static UsersState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsersState>(create);
  static UsersState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get userIds => $_getList(0);
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
    final $result = create();
    if (voiceInfo != null) {
      $result.voiceInfo = voiceInfo;
    }
    if (voiceData != null) {
      $result.voiceData = voiceData;
    }
    return $result;
  }
  SpeakToChannelRequest._() : super();
  factory SpeakToChannelRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpeakToChannelRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SpeakToChannelRequest_Request> _SpeakToChannelRequest_RequestByTag = {
    1 : SpeakToChannelRequest_Request.voiceInfo,
    2 : SpeakToChannelRequest_Request.voiceData,
    0 : SpeakToChannelRequest_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpeakToChannelRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice_relay.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..aOM<$1.VoiceData>(2, _omitFieldNames ? '' : 'voiceData', subBuilder: $1.VoiceData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpeakToChannelRequest clone() => SpeakToChannelRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpeakToChannelRequest copyWith(void Function(SpeakToChannelRequest) updates) => super.copyWith((message) => updates(message as SpeakToChannelRequest)) as SpeakToChannelRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeakToChannelRequest create() => SpeakToChannelRequest._();
  SpeakToChannelRequest createEmptyInstance() => create();
  static $pb.PbList<SpeakToChannelRequest> createRepeated() => $pb.PbList<SpeakToChannelRequest>();
  @$core.pragma('dart2js:noInline')
  static SpeakToChannelRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeakToChannelRequest>(create);
  static SpeakToChannelRequest? _defaultInstance;

  SpeakToChannelRequest_Request whichRequest() => _SpeakToChannelRequest_RequestByTag[$_whichOneof(0)]!;
  void clearRequest() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.VoiceInfo get voiceInfo => $_getN(0);
  @$pb.TagNumber(1)
  set voiceInfo($1.VoiceInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.VoiceInfo ensureVoiceInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.VoiceData get voiceData => $_getN(1);
  @$pb.TagNumber(2)
  set voiceData($1.VoiceData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoiceData() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceData() => clearField(2);
  @$pb.TagNumber(2)
  $1.VoiceData ensureVoiceData() => $_ensure(1);
}

class SpeakToChannelResponse extends $pb.GeneratedMessage {
  factory SpeakToChannelResponse() => create();
  SpeakToChannelResponse._() : super();
  factory SpeakToChannelResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpeakToChannelResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpeakToChannelResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice_relay.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpeakToChannelResponse clone() => SpeakToChannelResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpeakToChannelResponse copyWith(void Function(SpeakToChannelResponse) updates) => super.copyWith((message) => updates(message as SpeakToChannelResponse)) as SpeakToChannelResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeakToChannelResponse create() => SpeakToChannelResponse._();
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
    final $result = create();
    if (voiceInfo != null) {
      $result.voiceInfo = voiceInfo;
    }
    return $result;
  }
  ListenToUserRequest._() : super();
  factory ListenToUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListenToUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListenToUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice_relay.v1'), createEmptyInstance: create)
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListenToUserRequest clone() => ListenToUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListenToUserRequest copyWith(void Function(ListenToUserRequest) updates) => super.copyWith((message) => updates(message as ListenToUserRequest)) as ListenToUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListenToUserRequest create() => ListenToUserRequest._();
  ListenToUserRequest createEmptyInstance() => create();
  static $pb.PbList<ListenToUserRequest> createRepeated() => $pb.PbList<ListenToUserRequest>();
  @$core.pragma('dart2js:noInline')
  static ListenToUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListenToUserRequest>(create);
  static ListenToUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.VoiceInfo get voiceInfo => $_getN(0);
  @$pb.TagNumber(1)
  set voiceInfo($1.VoiceInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceInfo() => clearField(1);
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
    final $result = create();
    if (voiceInfo != null) {
      $result.voiceInfo = voiceInfo;
    }
    if (voiceData != null) {
      $result.voiceData = voiceData;
    }
    return $result;
  }
  ListenToUserResponse._() : super();
  factory ListenToUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListenToUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ListenToUserResponse_Response> _ListenToUserResponse_ResponseByTag = {
    1 : ListenToUserResponse_Response.voiceInfo,
    2 : ListenToUserResponse_Response.voiceData,
    0 : ListenToUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListenToUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice_relay.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..aOM<$1.VoiceData>(2, _omitFieldNames ? '' : 'voiceData', subBuilder: $1.VoiceData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListenToUserResponse clone() => ListenToUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListenToUserResponse copyWith(void Function(ListenToUserResponse) updates) => super.copyWith((message) => updates(message as ListenToUserResponse)) as ListenToUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListenToUserResponse create() => ListenToUserResponse._();
  ListenToUserResponse createEmptyInstance() => create();
  static $pb.PbList<ListenToUserResponse> createRepeated() => $pb.PbList<ListenToUserResponse>();
  @$core.pragma('dart2js:noInline')
  static ListenToUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListenToUserResponse>(create);
  static ListenToUserResponse? _defaultInstance;

  ListenToUserResponse_Response whichResponse() => _ListenToUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.VoiceInfo get voiceInfo => $_getN(0);
  @$pb.TagNumber(1)
  set voiceInfo($1.VoiceInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.VoiceInfo ensureVoiceInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.VoiceData get voiceData => $_getN(1);
  @$pb.TagNumber(2)
  set voiceData($1.VoiceData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoiceData() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceData() => clearField(2);
  @$pb.TagNumber(2)
  $1.VoiceData ensureVoiceData() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
