// This is a generated file - do not edit.
//
// Generated from confa/node/v1/service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../user/v1/user.pb.dart' as $2;
import 'auth_provider.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class SupportedClientVersionsRequest extends $pb.GeneratedMessage {
  factory SupportedClientVersionsRequest({
    $core.String? currentVersion,
  }) {
    final result = create();
    if (currentVersion != null) result.currentVersion = currentVersion;
    return result;
  }

  SupportedClientVersionsRequest._();

  factory SupportedClientVersionsRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SupportedClientVersionsRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SupportedClientVersionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportedClientVersionsRequest clone() => SupportedClientVersionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportedClientVersionsRequest copyWith(void Function(SupportedClientVersionsRequest) updates) => super.copyWith((message) => updates(message as SupportedClientVersionsRequest)) as SupportedClientVersionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsRequest create() => SupportedClientVersionsRequest._();
  @$core.override
  SupportedClientVersionsRequest createEmptyInstance() => create();
  static $pb.PbList<SupportedClientVersionsRequest> createRepeated() => $pb.PbList<SupportedClientVersionsRequest>();
  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportedClientVersionsRequest>(create);
  static SupportedClientVersionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentVersion($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentVersion() => $_clearField(1);
}

class SupportedClientVersionsResponse extends $pb.GeneratedMessage {
  factory SupportedClientVersionsResponse({
    $core.bool? supported,
    $core.String? minVersion,
  }) {
    final result = create();
    if (supported != null) result.supported = supported;
    if (minVersion != null) result.minVersion = minVersion;
    return result;
  }

  SupportedClientVersionsResponse._();

  factory SupportedClientVersionsResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SupportedClientVersionsResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SupportedClientVersionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'supported')
    ..aOS(2, _omitFieldNames ? '' : 'minVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportedClientVersionsResponse clone() => SupportedClientVersionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportedClientVersionsResponse copyWith(void Function(SupportedClientVersionsResponse) updates) => super.copyWith((message) => updates(message as SupportedClientVersionsResponse)) as SupportedClientVersionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsResponse create() => SupportedClientVersionsResponse._();
  @$core.override
  SupportedClientVersionsResponse createEmptyInstance() => create();
  static $pb.PbList<SupportedClientVersionsResponse> createRepeated() => $pb.PbList<SupportedClientVersionsResponse>();
  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportedClientVersionsResponse>(create);
  static SupportedClientVersionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get supported => $_getBF(0);
  @$pb.TagNumber(1)
  set supported($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupported() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupported() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get minVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set minVersion($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinVersion() => $_clearField(2);
}

class ListServersRequest extends $pb.GeneratedMessage {
  factory ListServersRequest() => create();

  ListServersRequest._();

  factory ListServersRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListServersRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListServersRequest clone() => ListServersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListServersRequest copyWith(void Function(ListServersRequest) updates) => super.copyWith((message) => updates(message as ListServersRequest)) as ListServersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServersRequest create() => ListServersRequest._();
  @$core.override
  ListServersRequest createEmptyInstance() => create();
  static $pb.PbList<ListServersRequest> createRepeated() => $pb.PbList<ListServersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListServersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServersRequest>(create);
  static ListServersRequest? _defaultInstance;
}

class ListServersResponse extends $pb.GeneratedMessage {
  factory ListServersResponse({
    $core.Iterable<$core.String>? serverIds,
  }) {
    final result = create();
    if (serverIds != null) result.serverIds.addAll(serverIds);
    return result;
  }

  ListServersResponse._();

  factory ListServersResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListServersResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'serverIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListServersResponse clone() => ListServersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListServersResponse copyWith(void Function(ListServersResponse) updates) => super.copyWith((message) => updates(message as ListServersResponse)) as ListServersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServersResponse create() => ListServersResponse._();
  @$core.override
  ListServersResponse createEmptyInstance() => create();
  static $pb.PbList<ListServersResponse> createRepeated() => $pb.PbList<ListServersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListServersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServersResponse>(create);
  static ListServersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get serverIds => $_getList(0);
}

class ListVoiceRelaysRequest extends $pb.GeneratedMessage {
  factory ListVoiceRelaysRequest() => create();

  ListVoiceRelaysRequest._();

  factory ListVoiceRelaysRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListVoiceRelaysRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListVoiceRelaysRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVoiceRelaysRequest clone() => ListVoiceRelaysRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVoiceRelaysRequest copyWith(void Function(ListVoiceRelaysRequest) updates) => super.copyWith((message) => updates(message as ListVoiceRelaysRequest)) as ListVoiceRelaysRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVoiceRelaysRequest create() => ListVoiceRelaysRequest._();
  @$core.override
  ListVoiceRelaysRequest createEmptyInstance() => create();
  static $pb.PbList<ListVoiceRelaysRequest> createRepeated() => $pb.PbList<ListVoiceRelaysRequest>();
  @$core.pragma('dart2js:noInline')
  static ListVoiceRelaysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVoiceRelaysRequest>(create);
  static ListVoiceRelaysRequest? _defaultInstance;
}

class VoiceRelay extends $pb.GeneratedMessage {
  factory VoiceRelay({
    $core.String? id,
    $core.String? name,
    $core.String? address,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (address != null) result.address = address;
    return result;
  }

  VoiceRelay._();

  factory VoiceRelay.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory VoiceRelay.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceRelay', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceRelay clone() => VoiceRelay()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceRelay copyWith(void Function(VoiceRelay) updates) => super.copyWith((message) => updates(message as VoiceRelay)) as VoiceRelay;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceRelay create() => VoiceRelay._();
  @$core.override
  VoiceRelay createEmptyInstance() => create();
  static $pb.PbList<VoiceRelay> createRepeated() => $pb.PbList<VoiceRelay>();
  @$core.pragma('dart2js:noInline')
  static VoiceRelay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceRelay>(create);
  static VoiceRelay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);
}

class ListVoiceRelaysResponse extends $pb.GeneratedMessage {
  factory ListVoiceRelaysResponse({
    $core.Iterable<VoiceRelay>? voiceRelays,
  }) {
    final result = create();
    if (voiceRelays != null) result.voiceRelays.addAll(voiceRelays);
    return result;
  }

  ListVoiceRelaysResponse._();

  factory ListVoiceRelaysResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListVoiceRelaysResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListVoiceRelaysResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..pc<VoiceRelay>(1, _omitFieldNames ? '' : 'voiceRelays', $pb.PbFieldType.PM, subBuilder: VoiceRelay.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVoiceRelaysResponse clone() => ListVoiceRelaysResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVoiceRelaysResponse copyWith(void Function(ListVoiceRelaysResponse) updates) => super.copyWith((message) => updates(message as ListVoiceRelaysResponse)) as ListVoiceRelaysResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVoiceRelaysResponse create() => ListVoiceRelaysResponse._();
  @$core.override
  ListVoiceRelaysResponse createEmptyInstance() => create();
  static $pb.PbList<ListVoiceRelaysResponse> createRepeated() => $pb.PbList<ListVoiceRelaysResponse>();
  @$core.pragma('dart2js:noInline')
  static ListVoiceRelaysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVoiceRelaysResponse>(create);
  static ListVoiceRelaysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<VoiceRelay> get voiceRelays => $_getList(0);
}

class ListAuthProvidersRequest extends $pb.GeneratedMessage {
  factory ListAuthProvidersRequest() => create();

  ListAuthProvidersRequest._();

  factory ListAuthProvidersRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListAuthProvidersRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAuthProvidersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAuthProvidersRequest clone() => ListAuthProvidersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAuthProvidersRequest copyWith(void Function(ListAuthProvidersRequest) updates) => super.copyWith((message) => updates(message as ListAuthProvidersRequest)) as ListAuthProvidersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersRequest create() => ListAuthProvidersRequest._();
  @$core.override
  ListAuthProvidersRequest createEmptyInstance() => create();
  static $pb.PbList<ListAuthProvidersRequest> createRepeated() => $pb.PbList<ListAuthProvidersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAuthProvidersRequest>(create);
  static ListAuthProvidersRequest? _defaultInstance;
}

class ListAuthProvidersResponse extends $pb.GeneratedMessage {
  factory ListAuthProvidersResponse({
    $core.Iterable<$1.AuthProvider>? authProviders,
  }) {
    final result = create();
    if (authProviders != null) result.authProviders.addAll(authProviders);
    return result;
  }

  ListAuthProvidersResponse._();

  factory ListAuthProvidersResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListAuthProvidersResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAuthProvidersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..pc<$1.AuthProvider>(1, _omitFieldNames ? '' : 'authProviders', $pb.PbFieldType.PM, subBuilder: $1.AuthProvider.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAuthProvidersResponse clone() => ListAuthProvidersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAuthProvidersResponse copyWith(void Function(ListAuthProvidersResponse) updates) => super.copyWith((message) => updates(message as ListAuthProvidersResponse)) as ListAuthProvidersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersResponse create() => ListAuthProvidersResponse._();
  @$core.override
  ListAuthProvidersResponse createEmptyInstance() => create();
  static $pb.PbList<ListAuthProvidersResponse> createRepeated() => $pb.PbList<ListAuthProvidersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAuthProvidersResponse>(create);
  static ListAuthProvidersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.AuthProvider> get authProviders => $_getList(0);
}

class GetUserRequest extends $pb.GeneratedMessage {
  factory GetUserRequest({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetUserRequest._();

  factory GetUserRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetUserRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest clone() => GetUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest copyWith(void Function(GetUserRequest) updates) => super.copyWith((message) => updates(message as GetUserRequest)) as GetUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  @$core.override
  GetUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserRequest> createRepeated() => $pb.PbList<GetUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class GetUserResponse extends $pb.GeneratedMessage {
  factory GetUserResponse({
    $2.User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  GetUserResponse._();

  factory GetUserResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetUserResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOM<$2.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $2.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserResponse clone() => GetUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserResponse copyWith(void Function(GetUserResponse) updates) => super.copyWith((message) => updates(message as GetUserResponse)) as GetUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserResponse create() => GetUserResponse._();
  @$core.override
  GetUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserResponse> createRepeated() => $pb.PbList<GetUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserResponse>(create);
  static GetUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($2.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.User ensureUser() => $_ensure(0);
}

class CurrentUserRequest extends $pb.GeneratedMessage {
  factory CurrentUserRequest() => create();

  CurrentUserRequest._();

  factory CurrentUserRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CurrentUserRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CurrentUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CurrentUserRequest clone() => CurrentUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CurrentUserRequest copyWith(void Function(CurrentUserRequest) updates) => super.copyWith((message) => updates(message as CurrentUserRequest)) as CurrentUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CurrentUserRequest create() => CurrentUserRequest._();
  @$core.override
  CurrentUserRequest createEmptyInstance() => create();
  static $pb.PbList<CurrentUserRequest> createRepeated() => $pb.PbList<CurrentUserRequest>();
  @$core.pragma('dart2js:noInline')
  static CurrentUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurrentUserRequest>(create);
  static CurrentUserRequest? _defaultInstance;
}

class CurrentUserResponse extends $pb.GeneratedMessage {
  factory CurrentUserResponse({
    $2.User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  CurrentUserResponse._();

  factory CurrentUserResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CurrentUserResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CurrentUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOM<$2.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $2.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CurrentUserResponse clone() => CurrentUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CurrentUserResponse copyWith(void Function(CurrentUserResponse) updates) => super.copyWith((message) => updates(message as CurrentUserResponse)) as CurrentUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CurrentUserResponse create() => CurrentUserResponse._();
  @$core.override
  CurrentUserResponse createEmptyInstance() => create();
  static $pb.PbList<CurrentUserResponse> createRepeated() => $pb.PbList<CurrentUserResponse>();
  @$core.pragma('dart2js:noInline')
  static CurrentUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurrentUserResponse>(create);
  static CurrentUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($2.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.User ensureUser() => $_ensure(0);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
