// This is a generated file - do not edit.
//
// Generated from confa/node/v1/auth_provider.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use authProviderDescriptor instead')
const AuthProvider$json = {
  '1': 'AuthProvider',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'openid_connect', '3': 101, '4': 1, '5': 11, '6': '.confa.node.v1.OpenIDConnect', '9': 0, '10': 'openidConnect'},
  ],
  '8': [
    {'1': 'protocol'},
  ],
};

/// Descriptor for `AuthProvider`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authProviderDescriptor = $convert.base64Decode(
    'CgxBdXRoUHJvdmlkZXISDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSRQoOb3'
    'BlbmlkX2Nvbm5lY3QYZSABKAsyHC5jb25mYS5ub2RlLnYxLk9wZW5JRENvbm5lY3RIAFINb3Bl'
    'bmlkQ29ubmVjdEIKCghwcm90b2NvbA==');

@$core.Deprecated('Use openIDConnectDescriptor instead')
const OpenIDConnect$json = {
  '1': 'OpenIDConnect',
  '2': [
    {'1': 'issuer', '3': 1, '4': 1, '5': 9, '10': 'issuer'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 9, '10': 'clientId'},
    {'1': 'client_secret', '3': 3, '4': 1, '5': 9, '10': 'clientSecret'},
  ],
};

/// Descriptor for `OpenIDConnect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List openIDConnectDescriptor = $convert.base64Decode(
    'Cg1PcGVuSURDb25uZWN0EhYKBmlzc3VlchgBIAEoCVIGaXNzdWVyEhsKCWNsaWVudF9pZBgCIA'
    'EoCVIIY2xpZW50SWQSIwoNY2xpZW50X3NlY3JldBgDIAEoCVIMY2xpZW50U2VjcmV0');

