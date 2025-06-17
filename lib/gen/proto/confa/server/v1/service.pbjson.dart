//
//  Generated code. Do not modify.
//  source: confa/server/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listChannelsRequestDescriptor instead')
const ListChannelsRequest$json = {
  '1': 'ListChannelsRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
  ],
};

/// Descriptor for `ListChannelsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listChannelsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0Q2hhbm5lbHNSZXF1ZXN0EhsKCXNlcnZlcl9pZBgBIAEoCVIIc2VydmVySWQ=');

@$core.Deprecated('Use listChannelsResponseDescriptor instead')
const ListChannelsResponse$json = {
  '1': 'ListChannelsResponse',
  '2': [
    {'1': 'channels', '3': 1, '4': 3, '5': 11, '6': '.confa.channel.v1.Channel', '10': 'channels'},
  ],
};

/// Descriptor for `ListChannelsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listChannelsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0Q2hhbm5lbHNSZXNwb25zZRI1CghjaGFubmVscxgBIAMoCzIZLmNvbmZhLmNoYW5uZW'
    'wudjEuQ2hhbm5lbFIIY2hhbm5lbHM=');

@$core.Deprecated('Use listUsersRequestDescriptor instead')
const ListUsersRequest$json = {
  '1': 'ListUsersRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
  ],
};

/// Descriptor for `ListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VXNlcnNSZXF1ZXN0EhsKCXNlcnZlcl9pZBgBIAEoCVIIc2VydmVySWQ=');

@$core.Deprecated('Use listUsersResponseDescriptor instead')
const ListUsersResponse$json = {
  '1': 'ListUsersResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.confa.user.v1.User', '10': 'users'},
  ],
};

/// Descriptor for `ListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VXNlcnNSZXNwb25zZRIpCgV1c2VycxgBIAMoCzITLmNvbmZhLnVzZXIudjEuVXNlcl'
    'IFdXNlcnM=');

@$core.Deprecated('Use createChannelRequestDescriptor instead')
const CreateChannelRequest$json = {
  '1': 'CreateChannelRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.confa.server.v1.CreateChannelRequest.ChannelType', '10': 'type'},
  ],
  '4': [CreateChannelRequest_ChannelType$json],
};

@$core.Deprecated('Use createChannelRequestDescriptor instead')
const CreateChannelRequest_ChannelType$json = {
  '1': 'ChannelType',
  '2': [
    {'1': 'TEXT', '2': 0},
    {'1': 'VOICE', '2': 1},
  ],
};

/// Descriptor for `CreateChannelRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChannelRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVDaGFubmVsUmVxdWVzdBIbCglzZXJ2ZXJfaWQYASABKAlSCHNlcnZlcklkEhIKBG'
    '5hbWUYAiABKAlSBG5hbWUSRQoEdHlwZRgDIAEoDjIxLmNvbmZhLnNlcnZlci52MS5DcmVhdGVD'
    'aGFubmVsUmVxdWVzdC5DaGFubmVsVHlwZVIEdHlwZSIiCgtDaGFubmVsVHlwZRIICgRURVhUEA'
    'ASCQoFVk9JQ0UQAQ==');

@$core.Deprecated('Use createChannelResponseDescriptor instead')
const CreateChannelResponse$json = {
  '1': 'CreateChannelResponse',
  '2': [
    {'1': 'channel', '3': 1, '4': 1, '5': 11, '6': '.confa.channel.v1.Channel', '10': 'channel'},
  ],
};

/// Descriptor for `CreateChannelResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChannelResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVDaGFubmVsUmVzcG9uc2USMwoHY2hhbm5lbBgBIAEoCzIZLmNvbmZhLmNoYW5uZW'
    'wudjEuQ2hhbm5lbFIHY2hhbm5lbA==');

