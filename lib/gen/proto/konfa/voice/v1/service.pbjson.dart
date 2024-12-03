//
//  Generated code. Do not modify.
//  source: konfa/voice/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use subscribeChannelStateRequestDescriptor instead')
const SubscribeChannelStateRequest$json = {
  '1': 'SubscribeChannelStateRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
  ],
};

/// Descriptor for `SubscribeChannelStateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeChannelStateRequestDescriptor = $convert.base64Decode(
    'ChxTdWJzY3JpYmVDaGFubmVsU3RhdGVSZXF1ZXN0EhsKCXNlcnZlcl9pZBgBIAEoCVIIc2Vydm'
    'VySWQSHQoKY2hhbm5lbF9pZBgCIAEoCVIJY2hhbm5lbElk');

@$core.Deprecated('Use subscribeChannelStateResponseDescriptor instead')
const SubscribeChannelStateResponse$json = {
  '1': 'SubscribeChannelStateResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 9, '10': 'users'},
  ],
};

/// Descriptor for `SubscribeChannelStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeChannelStateResponseDescriptor = $convert.base64Decode(
    'Ch1TdWJzY3JpYmVDaGFubmVsU3RhdGVSZXNwb25zZRIUCgV1c2VycxgBIAMoCVIFdXNlcnM=');

@$core.Deprecated('Use sendRequestDescriptor instead')
const SendRequest$json = {
  '1': 'SendRequest',
  '2': [
    {'1': 'voice_info', '3': 1, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceInfo', '9': 0, '10': 'voiceInfo'},
    {'1': 'voice_data', '3': 2, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceData', '9': 0, '10': 'voiceData'},
  ],
  '8': [
    {'1': 'request'},
  ],
};

/// Descriptor for `SendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendRequestDescriptor = $convert.base64Decode(
    'CgtTZW5kUmVxdWVzdBI6Cgp2b2ljZV9pbmZvGAEgASgLMhkua29uZmEudm9pY2UudjEuVm9pY2'
    'VJbmZvSABSCXZvaWNlSW5mbxI6Cgp2b2ljZV9kYXRhGAIgASgLMhkua29uZmEudm9pY2UudjEu'
    'Vm9pY2VEYXRhSABSCXZvaWNlRGF0YUIJCgdyZXF1ZXN0');

@$core.Deprecated('Use sendResponseDescriptor instead')
const SendResponse$json = {
  '1': 'SendResponse',
};

/// Descriptor for `SendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendResponseDescriptor = $convert.base64Decode(
    'CgxTZW5kUmVzcG9uc2U=');

@$core.Deprecated('Use receiveRequestDescriptor instead')
const ReceiveRequest$json = {
  '1': 'ReceiveRequest',
  '2': [
    {'1': 'voice_info', '3': 1, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceInfo', '10': 'voiceInfo'},
  ],
};

/// Descriptor for `ReceiveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveRequestDescriptor = $convert.base64Decode(
    'Cg5SZWNlaXZlUmVxdWVzdBI4Cgp2b2ljZV9pbmZvGAEgASgLMhkua29uZmEudm9pY2UudjEuVm'
    '9pY2VJbmZvUgl2b2ljZUluZm8=');

@$core.Deprecated('Use receiveResponseDescriptor instead')
const ReceiveResponse$json = {
  '1': 'ReceiveResponse',
  '2': [
    {'1': 'voice_info', '3': 1, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceInfo', '9': 0, '10': 'voiceInfo'},
    {'1': 'voice_data', '3': 2, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceData', '9': 0, '10': 'voiceData'},
  ],
  '8': [
    {'1': 'response'},
  ],
};

/// Descriptor for `ReceiveResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveResponseDescriptor = $convert.base64Decode(
    'Cg9SZWNlaXZlUmVzcG9uc2USOgoKdm9pY2VfaW5mbxgBIAEoCzIZLmtvbmZhLnZvaWNlLnYxLl'
    'ZvaWNlSW5mb0gAUgl2b2ljZUluZm8SOgoKdm9pY2VfZGF0YRgCIAEoCzIZLmtvbmZhLnZvaWNl'
    'LnYxLlZvaWNlRGF0YUgAUgl2b2ljZURhdGFCCgoIcmVzcG9uc2U=');

