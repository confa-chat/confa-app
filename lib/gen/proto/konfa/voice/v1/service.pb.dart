//
//  Generated code. Do not modify.
//  source: konfa/voice/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'voice.pb.dart' as $1;

class SubscribeChannelStateRequest extends $pb.GeneratedMessage {
  factory SubscribeChannelStateRequest({
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
  SubscribeChannelStateRequest._() : super();
  factory SubscribeChannelStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeChannelStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeChannelStateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeChannelStateRequest clone() => SubscribeChannelStateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeChannelStateRequest copyWith(void Function(SubscribeChannelStateRequest) updates) => super.copyWith((message) => updates(message as SubscribeChannelStateRequest)) as SubscribeChannelStateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeChannelStateRequest create() => SubscribeChannelStateRequest._();
  SubscribeChannelStateRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeChannelStateRequest> createRepeated() => $pb.PbList<SubscribeChannelStateRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeChannelStateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeChannelStateRequest>(create);
  static SubscribeChannelStateRequest? _defaultInstance;

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

class SubscribeChannelStateResponse extends $pb.GeneratedMessage {
  factory SubscribeChannelStateResponse({
    $core.Iterable<$core.String>? users,
  }) {
    final $result = create();
    if (users != null) {
      $result.users.addAll(users);
    }
    return $result;
  }
  SubscribeChannelStateResponse._() : super();
  factory SubscribeChannelStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeChannelStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeChannelStateResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'users')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeChannelStateResponse clone() => SubscribeChannelStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeChannelStateResponse copyWith(void Function(SubscribeChannelStateResponse) updates) => super.copyWith((message) => updates(message as SubscribeChannelStateResponse)) as SubscribeChannelStateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeChannelStateResponse create() => SubscribeChannelStateResponse._();
  SubscribeChannelStateResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeChannelStateResponse> createRepeated() => $pb.PbList<SubscribeChannelStateResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeChannelStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeChannelStateResponse>(create);
  static SubscribeChannelStateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get users => $_getList(0);
}

enum SendRequest_Request {
  voiceInfo, 
  voiceData, 
  notSet
}

class SendRequest extends $pb.GeneratedMessage {
  factory SendRequest({
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
  SendRequest._() : super();
  factory SendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SendRequest_Request> _SendRequest_RequestByTag = {
    1 : SendRequest_Request.voiceInfo,
    2 : SendRequest_Request.voiceData,
    0 : SendRequest_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..aOM<$1.VoiceData>(2, _omitFieldNames ? '' : 'voiceData', subBuilder: $1.VoiceData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendRequest clone() => SendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendRequest copyWith(void Function(SendRequest) updates) => super.copyWith((message) => updates(message as SendRequest)) as SendRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendRequest create() => SendRequest._();
  SendRequest createEmptyInstance() => create();
  static $pb.PbList<SendRequest> createRepeated() => $pb.PbList<SendRequest>();
  @$core.pragma('dart2js:noInline')
  static SendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendRequest>(create);
  static SendRequest? _defaultInstance;

  SendRequest_Request whichRequest() => _SendRequest_RequestByTag[$_whichOneof(0)]!;
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

class SendResponse extends $pb.GeneratedMessage {
  factory SendResponse() => create();
  SendResponse._() : super();
  factory SendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendResponse clone() => SendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendResponse copyWith(void Function(SendResponse) updates) => super.copyWith((message) => updates(message as SendResponse)) as SendResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendResponse create() => SendResponse._();
  SendResponse createEmptyInstance() => create();
  static $pb.PbList<SendResponse> createRepeated() => $pb.PbList<SendResponse>();
  @$core.pragma('dart2js:noInline')
  static SendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendResponse>(create);
  static SendResponse? _defaultInstance;
}

class ReceiveRequest extends $pb.GeneratedMessage {
  factory ReceiveRequest({
    $1.VoiceInfo? voiceInfo,
  }) {
    final $result = create();
    if (voiceInfo != null) {
      $result.voiceInfo = voiceInfo;
    }
    return $result;
  }
  ReceiveRequest._() : super();
  factory ReceiveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice.v1'), createEmptyInstance: create)
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveRequest clone() => ReceiveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveRequest copyWith(void Function(ReceiveRequest) updates) => super.copyWith((message) => updates(message as ReceiveRequest)) as ReceiveRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveRequest create() => ReceiveRequest._();
  ReceiveRequest createEmptyInstance() => create();
  static $pb.PbList<ReceiveRequest> createRepeated() => $pb.PbList<ReceiveRequest>();
  @$core.pragma('dart2js:noInline')
  static ReceiveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveRequest>(create);
  static ReceiveRequest? _defaultInstance;

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

enum ReceiveResponse_Response {
  voiceInfo, 
  voiceData, 
  notSet
}

class ReceiveResponse extends $pb.GeneratedMessage {
  factory ReceiveResponse({
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
  ReceiveResponse._() : super();
  factory ReceiveResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ReceiveResponse_Response> _ReceiveResponse_ResponseByTag = {
    1 : ReceiveResponse_Response.voiceInfo,
    2 : ReceiveResponse_Response.voiceData,
    0 : ReceiveResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.voice.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.VoiceInfo>(1, _omitFieldNames ? '' : 'voiceInfo', subBuilder: $1.VoiceInfo.create)
    ..aOM<$1.VoiceData>(2, _omitFieldNames ? '' : 'voiceData', subBuilder: $1.VoiceData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveResponse clone() => ReceiveResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveResponse copyWith(void Function(ReceiveResponse) updates) => super.copyWith((message) => updates(message as ReceiveResponse)) as ReceiveResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveResponse create() => ReceiveResponse._();
  ReceiveResponse createEmptyInstance() => create();
  static $pb.PbList<ReceiveResponse> createRepeated() => $pb.PbList<ReceiveResponse>();
  @$core.pragma('dart2js:noInline')
  static ReceiveResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveResponse>(create);
  static ReceiveResponse? _defaultInstance;

  ReceiveResponse_Response whichResponse() => _ReceiveResponse_ResponseByTag[$_whichOneof(0)]!;
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
