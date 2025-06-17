//
//  Generated code. Do not modify.
//  source: confa/hub/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use supportedClientVersionsRequestDescriptor instead')
const SupportedClientVersionsRequest$json = {
  '1': 'SupportedClientVersionsRequest',
  '2': [
    {'1': 'current_version', '3': 1, '4': 1, '5': 9, '10': 'currentVersion'},
  ],
};

/// Descriptor for `SupportedClientVersionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportedClientVersionsRequestDescriptor = $convert.base64Decode(
    'Ch5TdXBwb3J0ZWRDbGllbnRWZXJzaW9uc1JlcXVlc3QSJwoPY3VycmVudF92ZXJzaW9uGAEgAS'
    'gJUg5jdXJyZW50VmVyc2lvbg==');

@$core.Deprecated('Use supportedClientVersionsResponseDescriptor instead')
const SupportedClientVersionsResponse$json = {
  '1': 'SupportedClientVersionsResponse',
  '2': [
    {'1': 'supported', '3': 1, '4': 1, '5': 8, '10': 'supported'},
    {'1': 'min_version', '3': 2, '4': 1, '5': 9, '10': 'minVersion'},
  ],
};

/// Descriptor for `SupportedClientVersionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportedClientVersionsResponseDescriptor = $convert.base64Decode(
    'Ch9TdXBwb3J0ZWRDbGllbnRWZXJzaW9uc1Jlc3BvbnNlEhwKCXN1cHBvcnRlZBgBIAEoCFIJc3'
    'VwcG9ydGVkEh8KC21pbl92ZXJzaW9uGAIgASgJUgptaW5WZXJzaW9u');

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
    {'1': 'voice_relays', '3': 1, '4': 3, '5': 11, '6': '.confa.hub.v1.VoiceRelay', '10': 'voiceRelays'},
  ],
};

/// Descriptor for `ListVoiceRelaysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVoiceRelaysResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0Vm9pY2VSZWxheXNSZXNwb25zZRI7Cgx2b2ljZV9yZWxheXMYASADKAsyGC5jb25mYS'
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
    {'1': 'auth_providers', '3': 1, '4': 3, '5': 11, '6': '.confa.hub.v1.AuthProvider', '10': 'authProviders'},
  ],
};

/// Descriptor for `ListAuthProvidersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAuthProvidersResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0QXV0aFByb3ZpZGVyc1Jlc3BvbnNlEkEKDmF1dGhfcHJvdmlkZXJzGAEgAygLMhouY2'
    '9uZmEuaHViLnYxLkF1dGhQcm92aWRlclINYXV0aFByb3ZpZGVycw==');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.confa.user.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USJwoEdXNlchgBIAEoCzITLmNvbmZhLnVzZXIudjEuVXNlclIEdX'
    'Nlcg==');

@$core.Deprecated('Use currentUserRequestDescriptor instead')
const CurrentUserRequest$json = {
  '1': 'CurrentUserRequest',
};

/// Descriptor for `CurrentUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List currentUserRequestDescriptor = $convert.base64Decode(
    'ChJDdXJyZW50VXNlclJlcXVlc3Q=');

@$core.Deprecated('Use currentUserResponseDescriptor instead')
const CurrentUserResponse$json = {
  '1': 'CurrentUserResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.confa.user.v1.User', '10': 'user'},
  ],
};

/// Descriptor for `CurrentUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List currentUserResponseDescriptor = $convert.base64Decode(
    'ChNDdXJyZW50VXNlclJlc3BvbnNlEicKBHVzZXIYASABKAsyEy5jb25mYS51c2VyLnYxLlVzZX'
    'JSBHVzZXI=');

