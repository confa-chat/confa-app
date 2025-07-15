// This is a generated file - do not edit.
//
// Generated from confa/server/v1/service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../channel/v1/channels.pb.dart' as $1;
import '../../user/v1/user.pb.dart' as $2;
import 'service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'service.pbenum.dart';

class ListChannelsRequest extends $pb.GeneratedMessage {
  factory ListChannelsRequest({
    $core.String? serverId,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    return result;
  }

  ListChannelsRequest._();

  factory ListChannelsRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListChannelsRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListChannelsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListChannelsRequest clone() => ListChannelsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListChannelsRequest copyWith(void Function(ListChannelsRequest) updates) => super.copyWith((message) => updates(message as ListChannelsRequest)) as ListChannelsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListChannelsRequest create() => ListChannelsRequest._();
  @$core.override
  ListChannelsRequest createEmptyInstance() => create();
  static $pb.PbList<ListChannelsRequest> createRepeated() => $pb.PbList<ListChannelsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListChannelsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListChannelsRequest>(create);
  static ListChannelsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => $_clearField(1);
}

class ListChannelsResponse extends $pb.GeneratedMessage {
  factory ListChannelsResponse({
    $core.Iterable<$1.Channel>? channels,
  }) {
    final result = create();
    if (channels != null) result.channels.addAll(channels);
    return result;
  }

  ListChannelsResponse._();

  factory ListChannelsResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListChannelsResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListChannelsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..pc<$1.Channel>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.PM, subBuilder: $1.Channel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListChannelsResponse clone() => ListChannelsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListChannelsResponse copyWith(void Function(ListChannelsResponse) updates) => super.copyWith((message) => updates(message as ListChannelsResponse)) as ListChannelsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListChannelsResponse create() => ListChannelsResponse._();
  @$core.override
  ListChannelsResponse createEmptyInstance() => create();
  static $pb.PbList<ListChannelsResponse> createRepeated() => $pb.PbList<ListChannelsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListChannelsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListChannelsResponse>(create);
  static ListChannelsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.Channel> get channels => $_getList(0);
}

class ListUsersRequest extends $pb.GeneratedMessage {
  factory ListUsersRequest({
    $core.String? serverId,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    return result;
  }

  ListUsersRequest._();

  factory ListUsersRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListUsersRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersRequest clone() => ListUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersRequest copyWith(void Function(ListUsersRequest) updates) => super.copyWith((message) => updates(message as ListUsersRequest)) as ListUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersRequest create() => ListUsersRequest._();
  @$core.override
  ListUsersRequest createEmptyInstance() => create();
  static $pb.PbList<ListUsersRequest> createRepeated() => $pb.PbList<ListUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUsersRequest>(create);
  static ListUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => $_clearField(1);
}

class ListUsersResponse extends $pb.GeneratedMessage {
  factory ListUsersResponse({
    $core.Iterable<$2.User>? users,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    return result;
  }

  ListUsersResponse._();

  factory ListUsersResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListUsersResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..pc<$2.User>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: $2.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersResponse clone() => ListUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersResponse copyWith(void Function(ListUsersResponse) updates) => super.copyWith((message) => updates(message as ListUsersResponse)) as ListUsersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersResponse create() => ListUsersResponse._();
  @$core.override
  ListUsersResponse createEmptyInstance() => create();
  static $pb.PbList<ListUsersResponse> createRepeated() => $pb.PbList<ListUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUsersResponse>(create);
  static ListUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.User> get users => $_getList(0);
}

class CreateChannelRequest extends $pb.GeneratedMessage {
  factory CreateChannelRequest({
    $core.String? serverId,
    $core.String? name,
    CreateChannelRequest_ChannelType? type,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    return result;
  }

  CreateChannelRequest._();

  factory CreateChannelRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateChannelRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChannelRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..e<CreateChannelRequest_ChannelType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: CreateChannelRequest_ChannelType.TEXT, valueOf: CreateChannelRequest_ChannelType.valueOf, enumValues: CreateChannelRequest_ChannelType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelRequest clone() => CreateChannelRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelRequest copyWith(void Function(CreateChannelRequest) updates) => super.copyWith((message) => updates(message as CreateChannelRequest)) as CreateChannelRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChannelRequest create() => CreateChannelRequest._();
  @$core.override
  CreateChannelRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChannelRequest> createRepeated() => $pb.PbList<CreateChannelRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChannelRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChannelRequest>(create);
  static CreateChannelRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  CreateChannelRequest_ChannelType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(CreateChannelRequest_ChannelType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);
}

class CreateChannelResponse extends $pb.GeneratedMessage {
  factory CreateChannelResponse({
    $1.Channel? channel,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    return result;
  }

  CreateChannelResponse._();

  factory CreateChannelResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateChannelResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChannelResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..aOM<$1.Channel>(1, _omitFieldNames ? '' : 'channel', subBuilder: $1.Channel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelResponse clone() => CreateChannelResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelResponse copyWith(void Function(CreateChannelResponse) updates) => super.copyWith((message) => updates(message as CreateChannelResponse)) as CreateChannelResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChannelResponse create() => CreateChannelResponse._();
  @$core.override
  CreateChannelResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChannelResponse> createRepeated() => $pb.PbList<CreateChannelResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChannelResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChannelResponse>(create);
  static CreateChannelResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Channel get channel => $_getN(0);
  @$pb.TagNumber(1)
  set channel($1.Channel value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Channel ensureChannel() => $_ensure(0);
}

class EditChannelRequest extends $pb.GeneratedMessage {
  factory EditChannelRequest({
    $core.String? serverId,
    $core.String? channelId,
    $core.String? name,
    EditChannelRequest_ChannelType? type,
  }) {
    final result = create();
    if (serverId != null) result.serverId = serverId;
    if (channelId != null) result.channelId = channelId;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    return result;
  }

  EditChannelRequest._();

  factory EditChannelRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory EditChannelRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditChannelRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..e<EditChannelRequest_ChannelType>(4, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: EditChannelRequest_ChannelType.TEXT, valueOf: EditChannelRequest_ChannelType.valueOf, enumValues: EditChannelRequest_ChannelType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditChannelRequest clone() => EditChannelRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditChannelRequest copyWith(void Function(EditChannelRequest) updates) => super.copyWith((message) => updates(message as EditChannelRequest)) as EditChannelRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditChannelRequest create() => EditChannelRequest._();
  @$core.override
  EditChannelRequest createEmptyInstance() => create();
  static $pb.PbList<EditChannelRequest> createRepeated() => $pb.PbList<EditChannelRequest>();
  @$core.pragma('dart2js:noInline')
  static EditChannelRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditChannelRequest>(create);
  static EditChannelRequest? _defaultInstance;

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
  EditChannelRequest_ChannelType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(EditChannelRequest_ChannelType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);
}

class EditChannelResponse extends $pb.GeneratedMessage {
  factory EditChannelResponse({
    $1.Channel? channel,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    return result;
  }

  EditChannelResponse._();

  factory EditChannelResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory EditChannelResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditChannelResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.server.v1'), createEmptyInstance: create)
    ..aOM<$1.Channel>(1, _omitFieldNames ? '' : 'channel', subBuilder: $1.Channel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditChannelResponse clone() => EditChannelResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditChannelResponse copyWith(void Function(EditChannelResponse) updates) => super.copyWith((message) => updates(message as EditChannelResponse)) as EditChannelResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditChannelResponse create() => EditChannelResponse._();
  @$core.override
  EditChannelResponse createEmptyInstance() => create();
  static $pb.PbList<EditChannelResponse> createRepeated() => $pb.PbList<EditChannelResponse>();
  @$core.pragma('dart2js:noInline')
  static EditChannelResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditChannelResponse>(create);
  static EditChannelResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Channel get channel => $_getN(0);
  @$pb.TagNumber(1)
  set channel($1.Channel value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Channel ensureChannel() => $_ensure(0);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
