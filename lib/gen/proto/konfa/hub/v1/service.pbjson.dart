//
//  Generated code. Do not modify.
//  source: konfa/hub/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listServersRequestDescriptor instead')
const ListServersRequest$json = {
  '1': 'ListServersRequest',
};

/// Descriptor for `ListServersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServersRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0U2VydmVyc1JlcXVlc3Q=');

@$core.Deprecated('Use listServersResponseDescriptor instead')
const ListServersResponse$json = {
  '1': 'ListServersResponse',
  '2': [
    {'1': 'server_ids', '3': 1, '4': 3, '5': 9, '10': 'serverIds'},
  ],
};

/// Descriptor for `ListServersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServersResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0U2VydmVyc1Jlc3BvbnNlEh0KCnNlcnZlcl9pZHMYASADKAlSCXNlcnZlcklkcw==');

@$core.Deprecated('Use listVoiceRelaysRequestDescriptor instead')
const ListVoiceRelaysRequest$json = {
  '1': 'ListVoiceRelaysRequest',
};

/// Descriptor for `ListVoiceRelaysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVoiceRelaysRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0Vm9pY2VSZWxheXNSZXF1ZXN0');

@$core.Deprecated('Use voiceRelayDescriptor instead')
const VoiceRelay$json = {
  '1': 'VoiceRelay',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `VoiceRelay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceRelayDescriptor = $convert.base64Decode(
    'CgpWb2ljZVJlbGF5Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhgKB2FkZH'
    'Jlc3MYAyABKAlSB2FkZHJlc3M=');

@$core.Deprecated('Use listVoiceRelaysResponseDescriptor instead')
const ListVoiceRelaysResponse$json = {
  '1': 'ListVoiceRelaysResponse',
  '2': [
    {'1': 'voice_relays', '3': 1, '4': 3, '5': 11, '6': '.konfa.hub.v1.VoiceRelay', '10': 'voiceRelays'},
  ],
};

/// Descriptor for `ListVoiceRelaysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVoiceRelaysResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0Vm9pY2VSZWxheXNSZXNwb25zZRI7Cgx2b2ljZV9yZWxheXMYASADKAsyGC5rb25mYS'
    '5odWIudjEuVm9pY2VSZWxheVILdm9pY2VSZWxheXM=');

@$core.Deprecated('Use listAuthProvidersRequestDescriptor instead')
const ListAuthProvidersRequest$json = {
  '1': 'ListAuthProvidersRequest',
};

/// Descriptor for `ListAuthProvidersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAuthProvidersRequestDescriptor = $convert.base64Decode(
    'ChhMaXN0QXV0aFByb3ZpZGVyc1JlcXVlc3Q=');

@$core.Deprecated('Use listAuthProvidersResponseDescriptor instead')
const ListAuthProvidersResponse$json = {
  '1': 'ListAuthProvidersResponse',
  '2': [
    {'1': 'auth_providers', '3': 1, '4': 3, '5': 11, '6': '.konfa.hub.v1.AuthProvider', '10': 'authProviders'},
  ],
};

/// Descriptor for `ListAuthProvidersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAuthProvidersResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0QXV0aFByb3ZpZGVyc1Jlc3BvbnNlEkEKDmF1dGhfcHJvdmlkZXJzGAEgAygLMhoua2'
    '9uZmEuaHViLnYxLkF1dGhQcm92aWRlclINYXV0aFByb3ZpZGVycw==');

