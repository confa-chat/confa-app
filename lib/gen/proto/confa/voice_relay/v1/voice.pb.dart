// This is a generated file - do not edit.
//
// Generated from confa/voice_relay/v1/voice.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'voice.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'voice.pbenum.dart';

class SendMeta extends $pb.GeneratedMessage {
  factory SendMeta() => create();

  SendMeta._();

  factory SendMeta.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SendMeta.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendMeta', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendMeta clone() => SendMeta()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendMeta copyWith(void Function(SendMeta) updates) => super.copyWith((message) => updates(message as SendMeta)) as SendMeta;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMeta create() => SendMeta._();
  @$core.override
  SendMeta createEmptyInstance() => create();
  static $pb.PbList<SendMeta> createRepeated() => $pb.PbList<SendMeta>();
  @$core.pragma('dart2js:noInline')
  static SendMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMeta>(create);
  static SendMeta? _defaultInstance;
}

class VoiceInfo extends $pb.GeneratedMessage {
  factory VoiceInfo({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? userId,
    AudioCodec? codec,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    if (channelId != null) result.channelId = channelId;
    if (userId != null) result.userId = userId;
    if (codec != null) result.codec = codec;
    return result;
  }

  VoiceInfo._();

  factory VoiceInfo.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory VoiceInfo.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..e<AudioCodec>(4, _omitFieldNames ? '' : 'codec', $pb.PbFieldType.OE, defaultOrMaker: AudioCodec.AUDIO_CODEC_UNSPECIFIED, valueOf: AudioCodec.valueOf, enumValues: AudioCodec.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceInfo clone() => VoiceInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceInfo copyWith(void Function(VoiceInfo) updates) => super.copyWith((message) => updates(message as VoiceInfo)) as VoiceInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceInfo create() => VoiceInfo._();
  @$core.override
  VoiceInfo createEmptyInstance() => create();
  static $pb.PbList<VoiceInfo> createRepeated() => $pb.PbList<VoiceInfo>();
  @$core.pragma('dart2js:noInline')
  static VoiceInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceInfo>(create);
  static VoiceInfo? _defaultInstance;

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

  @$pb.TagNumber(4)
  AudioCodec get codec => $_getN(3);
  @$pb.TagNumber(4)
  set codec(AudioCodec value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCodec() => $_has(3);
  @$pb.TagNumber(4)
  void clearCodec() => $_clearField(4);
}

class ReceiveMeta extends $pb.GeneratedMessage {
  factory ReceiveMeta() => create();

  ReceiveMeta._();

  factory ReceiveMeta.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ReceiveMeta.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiveMeta', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceiveMeta clone() => ReceiveMeta()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceiveMeta copyWith(void Function(ReceiveMeta) updates) => super.copyWith((message) => updates(message as ReceiveMeta)) as ReceiveMeta;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveMeta create() => ReceiveMeta._();
  @$core.override
  ReceiveMeta createEmptyInstance() => create();
  static $pb.PbList<ReceiveMeta> createRepeated() => $pb.PbList<ReceiveMeta>();
  @$core.pragma('dart2js:noInline')
  static ReceiveMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveMeta>(create);
  static ReceiveMeta? _defaultInstance;
}

class VoiceData extends $pb.GeneratedMessage {
  factory VoiceData({
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (data != null) result.data = data;
    return result;
  }

  VoiceData._();

  factory VoiceData.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory VoiceData.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceData', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.voice_relay.v1'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceData clone() => VoiceData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceData copyWith(void Function(VoiceData) updates) => super.copyWith((message) => updates(message as VoiceData)) as VoiceData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceData create() => VoiceData._();
  @$core.override
  VoiceData createEmptyInstance() => create();
  static $pb.PbList<VoiceData> createRepeated() => $pb.PbList<VoiceData>();
  @$core.pragma('dart2js:noInline')
  static VoiceData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceData>(create);
  static VoiceData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => $_clearField(1);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
