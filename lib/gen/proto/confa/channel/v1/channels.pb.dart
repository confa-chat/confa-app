// This is a generated file - do not edit.
//
// Generated from confa/channel/v1/channels.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum Channel_Channel {
  textChannel, 
  voiceChannel, 
  notSet
}

class Channel extends $pb.GeneratedMessage {
  factory Channel({
    TextChannel? textChannel,
    VoiceChannel? voiceChannel,
  }) {
    final result = create();
    if (textChannel != null) result.textChannel = textChannel;
    if (voiceChannel != null) result.voiceChannel = voiceChannel;
    return result;
  }

  Channel._();

  factory Channel.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Channel.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Channel_Channel> _Channel_ChannelByTag = {
    1 : Channel_Channel.textChannel,
    2 : Channel_Channel.voiceChannel,
    0 : Channel_Channel.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Channel', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.channel.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<TextChannel>(1, _omitFieldNames ? '' : 'textChannel', subBuilder: TextChannel.create)
    ..aOM<VoiceChannel>(2, _omitFieldNames ? '' : 'voiceChannel', subBuilder: VoiceChannel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Channel clone() => Channel()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Channel copyWith(void Function(Channel) updates) => super.copyWith((message) => updates(message as Channel)) as Channel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Channel create() => Channel._();
  @$core.override
  Channel createEmptyInstance() => create();
  static $pb.PbList<Channel> createRepeated() => $pb.PbList<Channel>();
  @$core.pragma('dart2js:noInline')
  static Channel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Channel>(create);
  static Channel? _defaultInstance;

  Channel_Channel whichChannel() => _Channel_ChannelByTag[$_whichOneof(0)]!;
  void clearChannel() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TextChannel get textChannel => $_getN(0);
  @$pb.TagNumber(1)
  set textChannel(TextChannel value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTextChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearTextChannel() => $_clearField(1);
  @$pb.TagNumber(1)
  TextChannel ensureTextChannel() => $_ensure(0);

  @$pb.TagNumber(2)
  VoiceChannel get voiceChannel => $_getN(1);
  @$pb.TagNumber(2)
  set voiceChannel(VoiceChannel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVoiceChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceChannel() => $_clearField(2);
  @$pb.TagNumber(2)
  VoiceChannel ensureVoiceChannel() => $_ensure(1);
}

class TextChannel extends $pb.GeneratedMessage {
  factory TextChannel({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? name,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    if (channelId != null) result.channelId = channelId;
    if (name != null) result.name = name;
    return result;
  }

  TextChannel._();

  factory TextChannel.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory TextChannel.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextChannel', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.channel.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextChannel clone() => TextChannel()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextChannel copyWith(void Function(TextChannel) updates) => super.copyWith((message) => updates(message as TextChannel)) as TextChannel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextChannel create() => TextChannel._();
  @$core.override
  TextChannel createEmptyInstance() => create();
  static $pb.PbList<TextChannel> createRepeated() => $pb.PbList<TextChannel>();
  @$core.pragma('dart2js:noInline')
  static TextChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextChannel>(create);
  static TextChannel? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);
}

class VoiceChannel extends $pb.GeneratedMessage {
  factory VoiceChannel({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? name,
    $core.Iterable<$core.String>? voiceRelayId,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    if (channelId != null) result.channelId = channelId;
    if (name != null) result.name = name;
    if (voiceRelayId != null) result.voiceRelayId.addAll(voiceRelayId);
    return result;
  }

  VoiceChannel._();

  factory VoiceChannel.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory VoiceChannel.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceChannel', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.channel.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pPS(4, _omitFieldNames ? '' : 'voiceRelayId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceChannel clone() => VoiceChannel()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceChannel copyWith(void Function(VoiceChannel) updates) => super.copyWith((message) => updates(message as VoiceChannel)) as VoiceChannel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceChannel create() => VoiceChannel._();
  @$core.override
  VoiceChannel createEmptyInstance() => create();
  static $pb.PbList<VoiceChannel> createRepeated() => $pb.PbList<VoiceChannel>();
  @$core.pragma('dart2js:noInline')
  static VoiceChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceChannel>(create);
  static VoiceChannel? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get voiceRelayId => $_getList(3);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
