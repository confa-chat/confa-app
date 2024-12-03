//
//  Generated code. Do not modify.
//  source: konfa/voice/v1/voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use codecDescriptor instead')
const Codec$json = {
  '1': 'Codec',
  '2': [
    {'1': 'CODEC_UNSPECIFIED', '2': 0},
    {'1': 'CODEC_PCM_F32', '2': 1},
    {'1': 'CODEC_OPUS', '2': 2},
  ],
};

/// Descriptor for `Codec`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List codecDescriptor = $convert.base64Decode(
    'CgVDb2RlYxIVChFDT0RFQ19VTlNQRUNJRklFRBAAEhEKDUNPREVDX1BDTV9GMzIQARIOCgpDT0'
    'RFQ19PUFVTEAI=');

@$core.Deprecated('Use sendMetaDescriptor instead')
const SendMeta$json = {
  '1': 'SendMeta',
};

/// Descriptor for `SendMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMetaDescriptor = $convert.base64Decode(
    'CghTZW5kTWV0YQ==');

@$core.Deprecated('Use voiceInfoDescriptor instead')
const VoiceInfo$json = {
  '1': 'VoiceInfo',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'codec', '3': 4, '4': 1, '5': 14, '6': '.konfa.voice.v1.Codec', '10': 'codec'},
  ],
};

/// Descriptor for `VoiceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceInfoDescriptor = $convert.base64Decode(
    'CglWb2ljZUluZm8SGwoJc2VydmVyX2lkGAEgASgJUghzZXJ2ZXJJZBIdCgpjaGFubmVsX2lkGA'
    'IgASgJUgljaGFubmVsSWQSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklkEisKBWNvZGVjGAQgASgO'
    'MhUua29uZmEudm9pY2UudjEuQ29kZWNSBWNvZGVj');

@$core.Deprecated('Use receiveMetaDescriptor instead')
const ReceiveMeta$json = {
  '1': 'ReceiveMeta',
};

/// Descriptor for `ReceiveMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiveMetaDescriptor = $convert.base64Decode(
    'CgtSZWNlaXZlTWV0YQ==');

@$core.Deprecated('Use voiceDataDescriptor instead')
const VoiceData$json = {
  '1': 'VoiceData',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `VoiceData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceDataDescriptor = $convert.base64Decode(
    'CglWb2ljZURhdGESEgoEZGF0YRgBIAEoDFIEZGF0YQ==');

