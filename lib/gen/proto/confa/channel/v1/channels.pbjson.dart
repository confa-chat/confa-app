// This is a generated file - do not edit.
//
// Generated from confa/channel/v1/channels.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use channelDescriptor instead')
const Channel$json = {
  '1': 'Channel',
  '2': [
    {'1': 'text_channel', '3': 1, '4': 1, '5': 11, '6': '.confa.channel.v1.TextChannel', '9': 0, '10': 'textChannel'},
    {'1': 'voice_channel', '3': 2, '4': 1, '5': 11, '6': '.confa.channel.v1.VoiceChannel', '9': 0, '10': 'voiceChannel'},
  ],
  '8': [
    {'1': 'channel'},
  ],
};

/// Descriptor for `Channel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelDescriptor = $convert.base64Decode(
    'CgdDaGFubmVsEkIKDHRleHRfY2hhbm5lbBgBIAEoCzIdLmNvbmZhLmNoYW5uZWwudjEuVGV4dE'
    'NoYW5uZWxIAFILdGV4dENoYW5uZWwSRQoNdm9pY2VfY2hhbm5lbBgCIAEoCzIeLmNvbmZhLmNo'
    'YW5uZWwudjEuVm9pY2VDaGFubmVsSABSDHZvaWNlQ2hhbm5lbEIJCgdjaGFubmVs');

@$core.Deprecated('Use textChannelDescriptor instead')
const TextChannel$json = {
  '1': 'TextChannel',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TextChannel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textChannelDescriptor = $convert.base64Decode(
    'CgtUZXh0Q2hhbm5lbBIbCglzZXJ2ZXJfaWQYASABKAlSCHNlcnZlcklkEh0KCmNoYW5uZWxfaW'
    'QYAiABKAlSCWNoYW5uZWxJZBISCgRuYW1lGAMgASgJUgRuYW1l');

@$core.Deprecated('Use voiceChannelDescriptor instead')
const VoiceChannel$json = {
  '1': 'VoiceChannel',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'voice_relay_id', '3': 4, '4': 3, '5': 9, '10': 'voiceRelayId'},
  ],
};

/// Descriptor for `VoiceChannel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceChannelDescriptor = $convert.base64Decode(
    'CgxWb2ljZUNoYW5uZWwSGwoJc2VydmVyX2lkGAEgASgJUghzZXJ2ZXJJZBIdCgpjaGFubmVsX2'
    'lkGAIgASgJUgljaGFubmVsSWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIkCg52b2ljZV9yZWxheV9p'
    'ZBgEIAMoCVIMdm9pY2VSZWxheUlk');

