// This is a generated file - do not edit.
//
// Generated from confa/node/v1/auth_provider.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum AuthProvider_Protocol {
  openidConnect, 
  notSet
}

class AuthProvider extends $pb.GeneratedMessage {
  factory AuthProvider({
    $core.String? id,
    $core.String? name,
    OpenIDConnect? openidConnect,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (openidConnect != null) result.openidConnect = openidConnect;
    return result;
  }

  AuthProvider._();

  factory AuthProvider.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory AuthProvider.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, AuthProvider_Protocol> _AuthProvider_ProtocolByTag = {
    101 : AuthProvider_Protocol.openidConnect,
    0 : AuthProvider_Protocol.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthProvider', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..oo(0, [101])
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<OpenIDConnect>(101, _omitFieldNames ? '' : 'openidConnect', subBuilder: OpenIDConnect.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthProvider clone() => AuthProvider()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthProvider copyWith(void Function(AuthProvider) updates) => super.copyWith((message) => updates(message as AuthProvider)) as AuthProvider;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthProvider create() => AuthProvider._();
  @$core.override
  AuthProvider createEmptyInstance() => create();
  static $pb.PbList<AuthProvider> createRepeated() => $pb.PbList<AuthProvider>();
  @$core.pragma('dart2js:noInline')
  static AuthProvider getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthProvider>(create);
  static AuthProvider? _defaultInstance;

  AuthProvider_Protocol whichProtocol() => _AuthProvider_ProtocolByTag[$_whichOneof(0)]!;
  void clearProtocol() => $_clearField($_whichOneof(0));

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

  @$pb.TagNumber(101)
  OpenIDConnect get openidConnect => $_getN(2);
  @$pb.TagNumber(101)
  set openidConnect(OpenIDConnect value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasOpenidConnect() => $_has(2);
  @$pb.TagNumber(101)
  void clearOpenidConnect() => $_clearField(101);
  @$pb.TagNumber(101)
  OpenIDConnect ensureOpenidConnect() => $_ensure(2);
}

class OpenIDConnect extends $pb.GeneratedMessage {
  factory OpenIDConnect({
    $core.String? issuer,
    $core.String? clientId,
    $core.String? clientSecret,
  }) {
    final result = create();
    if (issuer != null) result.issuer = issuer;
    if (clientId != null) result.clientId = clientId;
    if (clientSecret != null) result.clientSecret = clientSecret;
    return result;
  }

  OpenIDConnect._();

  factory OpenIDConnect.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory OpenIDConnect.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpenIDConnect', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'issuer')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'clientSecret')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OpenIDConnect clone() => OpenIDConnect()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OpenIDConnect copyWith(void Function(OpenIDConnect) updates) => super.copyWith((message) => updates(message as OpenIDConnect)) as OpenIDConnect;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpenIDConnect create() => OpenIDConnect._();
  @$core.override
  OpenIDConnect createEmptyInstance() => create();
  static $pb.PbList<OpenIDConnect> createRepeated() => $pb.PbList<OpenIDConnect>();
  @$core.pragma('dart2js:noInline')
  static OpenIDConnect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpenIDConnect>(create);
  static OpenIDConnect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issuer => $_getSZ(0);
  @$pb.TagNumber(1)
  set issuer($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIssuer() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssuer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get clientSecret => $_getSZ(2);
  @$pb.TagNumber(3)
  set clientSecret($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasClientSecret() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientSecret() => $_clearField(3);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
