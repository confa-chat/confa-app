//
//  Generated code. Do not modify.
//  source: confa/node/v1/auth_provider.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (openidConnect != null) {
      $result.openidConnect = openidConnect;
    }
    return $result;
  }
  AuthProvider._() : super();
  factory AuthProvider.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthProvider.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

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

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthProvider clone() => AuthProvider()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthProvider copyWith(void Function(AuthProvider) updates) => super.copyWith((message) => updates(message as AuthProvider)) as AuthProvider;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthProvider create() => AuthProvider._();
  AuthProvider createEmptyInstance() => create();
  static $pb.PbList<AuthProvider> createRepeated() => $pb.PbList<AuthProvider>();
  @$core.pragma('dart2js:noInline')
  static AuthProvider getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthProvider>(create);
  static AuthProvider? _defaultInstance;

  AuthProvider_Protocol whichProtocol() => _AuthProvider_ProtocolByTag[$_whichOneof(0)]!;
  void clearProtocol() => clearField($_whichOneof(0));

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

  @$pb.TagNumber(101)
  OpenIDConnect get openidConnect => $_getN(2);
  @$pb.TagNumber(101)
  set openidConnect(OpenIDConnect v) { setField(101, v); }
  @$pb.TagNumber(101)
  $core.bool hasOpenidConnect() => $_has(2);
  @$pb.TagNumber(101)
  void clearOpenidConnect() => clearField(101);
  @$pb.TagNumber(101)
  OpenIDConnect ensureOpenidConnect() => $_ensure(2);
}

class OpenIDConnect extends $pb.GeneratedMessage {
  factory OpenIDConnect({
    $core.String? issuer,
    $core.String? clientId,
    $core.String? clientSecret,
  }) {
    final $result = create();
    if (issuer != null) {
      $result.issuer = issuer;
    }
    if (clientId != null) {
      $result.clientId = clientId;
    }
    if (clientSecret != null) {
      $result.clientSecret = clientSecret;
    }
    return $result;
  }
  OpenIDConnect._() : super();
  factory OpenIDConnect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpenIDConnect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpenIDConnect', package: const $pb.PackageName(_omitMessageNames ? '' : 'confa.node.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'issuer')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..aOS(3, _omitFieldNames ? '' : 'clientSecret')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpenIDConnect clone() => OpenIDConnect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpenIDConnect copyWith(void Function(OpenIDConnect) updates) => super.copyWith((message) => updates(message as OpenIDConnect)) as OpenIDConnect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpenIDConnect create() => OpenIDConnect._();
  OpenIDConnect createEmptyInstance() => create();
  static $pb.PbList<OpenIDConnect> createRepeated() => $pb.PbList<OpenIDConnect>();
  @$core.pragma('dart2js:noInline')
  static OpenIDConnect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpenIDConnect>(create);
  static OpenIDConnect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get issuer => $_getSZ(0);
  @$pb.TagNumber(1)
  set issuer($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIssuer() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssuer() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clientSecret => $_getSZ(2);
  @$pb.TagNumber(3)
  set clientSecret($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClientSecret() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientSecret() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
