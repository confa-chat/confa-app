//
//  Generated code. Do not modify.
//  source: konfa/server/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listServerChannelsRequestDescriptor instead')
const ListServerChannelsRequest$json = {
  '1': 'ListServerChannelsRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
  ],
};

/// Descriptor for `ListServerChannelsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServerChannelsRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0U2VydmVyQ2hhbm5lbHNSZXF1ZXN0EhsKCXNlcnZlcl9pZBgBIAEoCVIIc2VydmVySW'
    'Q=');

@$core.Deprecated('Use listServerChannelsResponseDescriptor instead')
const ListServerChannelsResponse$json = {
  '1': 'ListServerChannelsResponse',
  '2': [
    {'1': 'channels', '3': 1, '4': 3, '5': 11, '6': '.konfa.channel.v1.Channel', '10': 'channels'},
  ],
};

/// Descriptor for `ListServerChannelsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServerChannelsResponseDescriptor = $convert.base64Decode(
    'ChpMaXN0U2VydmVyQ2hhbm5lbHNSZXNwb25zZRI1CghjaGFubmVscxgBIAMoCzIZLmtvbmZhLm'
    'NoYW5uZWwudjEuQ2hhbm5lbFIIY2hhbm5lbHM=');

@$core.Deprecated('Use listServerUsersRequestDescriptor instead')
const ListServerUsersRequest$json = {
  '1': 'ListServerUsersRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
  ],
};

/// Descriptor for `ListServerUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServerUsersRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0U2VydmVyVXNlcnNSZXF1ZXN0EhsKCXNlcnZlcl9pZBgBIAEoCVIIc2VydmVySWQ=');

@$core.Deprecated('Use listServerUsersResponseDescriptor instead')
const ListServerUsersResponse$json = {
  '1': 'ListServerUsersResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.konfa.user.v1.User', '10': 'users'},
  ],
};

/// Descriptor for `ListServerUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServerUsersResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0U2VydmVyVXNlcnNSZXNwb25zZRIpCgV1c2VycxgBIAMoCzITLmtvbmZhLnVzZXIudj'
    'EuVXNlclIFdXNlcnM=');

@$core.Deprecated('Use createChannelRequestDescriptor instead')
const CreateChannelRequest$json = {
  '1': 'CreateChannelRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.konfa.server.v1.CreateChannelRequest.ChannelType', '10': 'type'},
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
    '5hbWUYAiABKAlSBG5hbWUSRQoEdHlwZRgDIAEoDjIxLmtvbmZhLnNlcnZlci52MS5DcmVhdGVD'
    'aGFubmVsUmVxdWVzdC5DaGFubmVsVHlwZVIEdHlwZSIiCgtDaGFubmVsVHlwZRIICgRURVhUEA'
    'ASCQoFVk9JQ0UQAQ==');

@$core.Deprecated('Use createChannelResponseDescriptor instead')
const CreateChannelResponse$json = {
  '1': 'CreateChannelResponse',
  '2': [
    {'1': 'channel', '3': 1, '4': 1, '5': 11, '6': '.konfa.channel.v1.Channel', '10': 'channel'},
  ],
};

/// Descriptor for `CreateChannelResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChannelResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVDaGFubmVsUmVzcG9uc2USMwoHY2hhbm5lbBgBIAEoCzIZLmtvbmZhLmNoYW5uZW'
    'wudjEuQ2hhbm5lbFIHY2hhbm5lbA==');

