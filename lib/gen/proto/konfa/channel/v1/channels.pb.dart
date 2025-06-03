//
//  Generated code. Do not modify.
//  source: konfa/channel/v1/channels.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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
    final $result = create();
    if (textChannel != null) {
      $result.textChannel = textChannel;
    }
    if (voiceChannel != null) {
      $result.voiceChannel = voiceChannel;
    }
    return $result;
  }
  Channel._() : super();
  factory Channel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Channel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Channel_Channel> _Channel_ChannelByTag = {
    1 : Channel_Channel.textChannel,
    2 : Channel_Channel.voiceChannel,
    0 : Channel_Channel.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Channel', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.channel.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<TextChannel>(1, _omitFieldNames ? '' : 'textChannel', subBuilder: TextChannel.create)
    ..aOM<VoiceChannel>(2, _omitFieldNames ? '' : 'voiceChannel', subBuilder: VoiceChannel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Channel clone() => Channel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Channel copyWith(void Function(Channel) updates) => super.copyWith((message) => updates(message as Channel)) as Channel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Channel create() => Channel._();
  Channel createEmptyInstance() => create();
  static $pb.PbList<Channel> createRepeated() => $pb.PbList<Channel>();
  @$core.pragma('dart2js:noInline')
  static Channel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Channel>(create);
  static Channel? _defaultInstance;

  Channel_Channel whichChannel() => _Channel_ChannelByTag[$_whichOneof(0)]!;
  void clearChannel() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TextChannel get textChannel => $_getN(0);
  @$pb.TagNumber(1)
  set textChannel(TextChannel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTextChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearTextChannel() => clearField(1);
  @$pb.TagNumber(1)
  TextChannel ensureTextChannel() => $_ensure(0);

  @$pb.TagNumber(2)
  VoiceChannel get voiceChannel => $_getN(1);
  @$pb.TagNumber(2)
  set voiceChannel(VoiceChannel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoiceChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceChannel() => clearField(2);
  @$pb.TagNumber(2)
  VoiceChannel ensureVoiceChannel() => $_ensure(1);
}

class TextChannel extends $pb.GeneratedMessage {
  factory TextChannel({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? name,
  }) {
    final $result = create();
    if (serverId != null) {
      $result.serverId = serverId;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  TextChannel._() : super();
  factory TextChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextChannel', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.channel.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextChannel clone() => TextChannel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextChannel copyWith(void Function(TextChannel) updates) => super.copyWith((message) => updates(message as TextChannel)) as TextChannel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextChannel create() => TextChannel._();
  TextChannel createEmptyInstance() => create();
  static $pb.PbList<TextChannel> createRepeated() => $pb.PbList<TextChannel>();
  @$core.pragma('dart2js:noInline')
  static TextChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextChannel>(create);
  static TextChannel? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class VoiceChannel extends $pb.GeneratedMessage {
  factory VoiceChannel({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? name,
    $core.Iterable<$core.String>? voiceRelayId,
  }) {
    final $result = create();
    if (serverId != null) {
      $result.serverId = serverId;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (voiceRelayId != null) {
      $result.voiceRelayId.addAll(voiceRelayId);
    }
    return $result;
  }
  VoiceChannel._() : super();
  factory VoiceChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceChannel', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.channel.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pPS(4, _omitFieldNames ? '' : 'voiceRelayId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoiceChannel clone() => VoiceChannel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoiceChannel copyWith(void Function(VoiceChannel) updates) => super.copyWith((message) => updates(message as VoiceChannel)) as VoiceChannel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceChannel create() => VoiceChannel._();
  VoiceChannel createEmptyInstance() => create();
  static $pb.PbList<VoiceChannel> createRepeated() => $pb.PbList<VoiceChannel>();
  @$core.pragma('dart2js:noInline')
  static VoiceChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceChannel>(create);
  static VoiceChannel? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get voiceRelayId => $_getList(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
