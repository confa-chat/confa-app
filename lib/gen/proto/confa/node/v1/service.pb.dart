//
//  Generated code. Do not modify.
//  source: confa/node/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../user/v1/user.pb.dart' as $5;
import 'auth_provider.pb.dart' as $4;

class SupportedClientVersionsRequest extends $pb.GeneratedMessage {
  factory SupportedClientVersionsRequest({
    $core.String? currentVersion,
  }) {
    final $result = create();
    if (currentVersion != null) {
      $result.currentVersion = currentVersion;
    }
    return $result;
  }
  SupportedClientVersionsRequest._() : super();
  factory SupportedClientVersionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupportedClientVersionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SupportedClientVersionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SupportedClientVersionsRequest clone() => SupportedClientVersionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SupportedClientVersionsRequest copyWith(void Function(SupportedClientVersionsRequest) updates) => super.copyWith((message) => updates(message as SupportedClientVersionsRequest)) as SupportedClientVersionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsRequest create() => SupportedClientVersionsRequest._();
  SupportedClientVersionsRequest createEmptyInstance() => create();
  static $pb.PbList<SupportedClientVersionsRequest> createRepeated() => $pb.PbList<SupportedClientVersionsRequest>();
  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportedClientVersionsRequest>(create);
  static SupportedClientVersionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentVersion() => clearField(1);
}

class SupportedClientVersionsResponse extends $pb.GeneratedMessage {
  factory SupportedClientVersionsResponse({
    $core.bool? supported,
    $core.String? minVersion,
  }) {
    final $result = create();
    if (supported != null) {
      $result.supported = supported;
    }
    if (minVersion != null) {
      $result.minVersion = minVersion;
    }
    return $result;
  }
  SupportedClientVersionsResponse._() : super();
  factory SupportedClientVersionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupportedClientVersionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SupportedClientVersionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'supported')
    ..aOS(2, _omitFieldNames ? '' : 'minVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SupportedClientVersionsResponse clone() => SupportedClientVersionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SupportedClientVersionsResponse copyWith(void Function(SupportedClientVersionsResponse) updates) => super.copyWith((message) => updates(message as SupportedClientVersionsResponse)) as SupportedClientVersionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsResponse create() => SupportedClientVersionsResponse._();
  SupportedClientVersionsResponse createEmptyInstance() => create();
  static $pb.PbList<SupportedClientVersionsResponse> createRepeated() => $pb.PbList<SupportedClientVersionsResponse>();
  @$core.pragma('dart2js:noInline')
  static SupportedClientVersionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportedClientVersionsResponse>(create);
  static SupportedClientVersionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get supported => $_getBF(0);
  @$pb.TagNumber(1)
  set supported($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSupported() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupported() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get minVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set minVersion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinVersion() => clearField(2);
}

class ListServersRequest extends $pb.GeneratedMessage {
  factory ListServersRequest() => create();
  ListServersRequest._() : super();
  factory ListServersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListServersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListServersRequest clone() => ListServersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListServersRequest copyWith(void Function(ListServersRequest) updates) => super.copyWith((message) => updates(message as ListServersRequest)) as ListServersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServersRequest create() => ListServersRequest._();
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
    final $result = create();
    if (serverIds != null) {
      $result.serverIds.addAll(serverIds);
    }
    return $result;
  }
  ListServersResponse._() : super();
  factory ListServersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListServersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'serverIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListServersResponse clone() => ListServersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListServersResponse copyWith(void Function(ListServersResponse) updates) => super.copyWith((message) => updates(message as ListServersResponse)) as ListServersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServersResponse create() => ListServersResponse._();
  ListServersResponse createEmptyInstance() => create();
  static $pb.PbList<ListServersResponse> createRepeated() => $pb.PbList<ListServersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListServersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServersResponse>(create);
  static ListServersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get serverIds => $_getList(0);
}

class ListVoiceRelaysRequest extends $pb.GeneratedMessage {
  factory ListVoiceRelaysRequest() => create();
  ListVoiceRelaysRequest._() : super();
  factory ListVoiceRelaysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVoiceRelaysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListVoiceRelaysRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVoiceRelaysRequest clone() => ListVoiceRelaysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVoiceRelaysRequest copyWith(void Function(ListVoiceRelaysRequest) updates) => super.copyWith((message) => updates(message as ListVoiceRelaysRequest)) as ListVoiceRelaysRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVoiceRelaysRequest create() => ListVoiceRelaysRequest._();
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
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  VoiceRelay._() : super();
  factory VoiceRelay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceRelay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceRelay', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoiceRelay clone() => VoiceRelay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoiceRelay copyWith(void Function(VoiceRelay) updates) => super.copyWith((message) => updates(message as VoiceRelay)) as VoiceRelay;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceRelay create() => VoiceRelay._();
  VoiceRelay createEmptyInstance() => create();
  static $pb.PbList<VoiceRelay> createRepeated() => $pb.PbList<VoiceRelay>();
  @$core.pragma('dart2js:noInline')
  static VoiceRelay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceRelay>(create);
  static VoiceRelay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);
}

class ListVoiceRelaysResponse extends $pb.GeneratedMessage {
  factory ListVoiceRelaysResponse({
    $core.Iterable<VoiceRelay>? voiceRelays,
  }) {
    final $result = create();
    if (voiceRelays != null) {
      $result.voiceRelays.addAll(voiceRelays);
    }
    return $result;
  }
  ListVoiceRelaysResponse._() : super();
  factory ListVoiceRelaysResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVoiceRelaysResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListVoiceRelaysResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..pc<VoiceRelay>(1, _omitFieldNames ? '' : 'voiceRelays', $pb.PbFieldType.PM, subBuilder: VoiceRelay.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVoiceRelaysResponse clone() => ListVoiceRelaysResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVoiceRelaysResponse copyWith(void Function(ListVoiceRelaysResponse) updates) => super.copyWith((message) => updates(message as ListVoiceRelaysResponse)) as ListVoiceRelaysResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVoiceRelaysResponse create() => ListVoiceRelaysResponse._();
  ListVoiceRelaysResponse createEmptyInstance() => create();
  static $pb.PbList<ListVoiceRelaysResponse> createRepeated() => $pb.PbList<ListVoiceRelaysResponse>();
  @$core.pragma('dart2js:noInline')
  static ListVoiceRelaysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVoiceRelaysResponse>(create);
  static ListVoiceRelaysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<VoiceRelay> get voiceRelays => $_getList(0);
}

class ListAuthProvidersRequest extends $pb.GeneratedMessage {
  factory ListAuthProvidersRequest() => create();
  ListAuthProvidersRequest._() : super();
  factory ListAuthProvidersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAuthProvidersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAuthProvidersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAuthProvidersRequest clone() => ListAuthProvidersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAuthProvidersRequest copyWith(void Function(ListAuthProvidersRequest) updates) => super.copyWith((message) => updates(message as ListAuthProvidersRequest)) as ListAuthProvidersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersRequest create() => ListAuthProvidersRequest._();
  ListAuthProvidersRequest createEmptyInstance() => create();
  static $pb.PbList<ListAuthProvidersRequest> createRepeated() => $pb.PbList<ListAuthProvidersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAuthProvidersRequest>(create);
  static ListAuthProvidersRequest? _defaultInstance;
}

class ListAuthProvidersResponse extends $pb.GeneratedMessage {
  factory ListAuthProvidersResponse({
    $core.Iterable<$4.AuthProvider>? authProviders,
  }) {
    final $result = create();
    if (authProviders != null) {
      $result.authProviders.addAll(authProviders);
    }
    return $result;
  }
  ListAuthProvidersResponse._() : super();
  factory ListAuthProvidersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAuthProvidersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAuthProvidersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..pc<$4.AuthProvider>(1, _omitFieldNames ? '' : 'authProviders', $pb.PbFieldType.PM, subBuilder: $4.AuthProvider.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAuthProvidersResponse clone() => ListAuthProvidersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAuthProvidersResponse copyWith(void Function(ListAuthProvidersResponse) updates) => super.copyWith((message) => updates(message as ListAuthProvidersResponse)) as ListAuthProvidersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersResponse create() => ListAuthProvidersResponse._();
  ListAuthProvidersResponse createEmptyInstance() => create();
  static $pb.PbList<ListAuthProvidersResponse> createRepeated() => $pb.PbList<ListAuthProvidersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAuthProvidersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAuthProvidersResponse>(create);
  static ListAuthProvidersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.AuthProvider> get authProviders => $_getList(0);
}

class GetUserRequest extends $pb.GeneratedMessage {
  factory GetUserRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetUserRequest._() : super();
  factory GetUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserRequest clone() => GetUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserRequest copyWith(void Function(GetUserRequest) updates) => super.copyWith((message) => updates(message as GetUserRequest)) as GetUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  GetUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserRequest> createRepeated() => $pb.PbList<GetUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetUserResponse extends $pb.GeneratedMessage {
  factory GetUserResponse({
    $5.User? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  GetUserResponse._() : super();
  factory GetUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOM<$5.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $5.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserResponse clone() => GetUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserResponse copyWith(void Function(GetUserResponse) updates) => super.copyWith((message) => updates(message as GetUserResponse)) as GetUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserResponse create() => GetUserResponse._();
  GetUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserResponse> createRepeated() => $pb.PbList<GetUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserResponse>(create);
  static GetUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($5.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $5.User ensureUser() => $_ensure(0);
}

class CurrentUserRequest extends $pb.GeneratedMessage {
  factory CurrentUserRequest() => create();
  CurrentUserRequest._() : super();
  factory CurrentUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurrentUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CurrentUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurrentUserRequest clone() => CurrentUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurrentUserRequest copyWith(void Function(CurrentUserRequest) updates) => super.copyWith((message) => updates(message as CurrentUserRequest)) as CurrentUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CurrentUserRequest create() => CurrentUserRequest._();
  CurrentUserRequest createEmptyInstance() => create();
  static $pb.PbList<CurrentUserRequest> createRepeated() => $pb.PbList<CurrentUserRequest>();
  @$core.pragma('dart2js:noInline')
  static CurrentUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurrentUserRequest>(create);
  static CurrentUserRequest? _defaultInstance;
}

class CurrentUserResponse extends $pb.GeneratedMessage {
  factory CurrentUserResponse({
    $5.User? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  CurrentUserResponse._() : super();
  factory CurrentUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurrentUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CurrentUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOM<$5.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $5.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurrentUserResponse clone() => CurrentUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurrentUserResponse copyWith(void Function(CurrentUserResponse) updates) => super.copyWith((message) => updates(message as CurrentUserResponse)) as CurrentUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CurrentUserResponse create() => CurrentUserResponse._();
  CurrentUserResponse createEmptyInstance() => create();
  static $pb.PbList<CurrentUserResponse> createRepeated() => $pb.PbList<CurrentUserResponse>();
  @$core.pragma('dart2js:noInline')
  static CurrentUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurrentUserResponse>(create);
  static CurrentUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($5.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $5.User ensureUser() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
