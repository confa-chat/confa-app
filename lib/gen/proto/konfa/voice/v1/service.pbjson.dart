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

@$core.Deprecated('Use joinChannelRequestDescriptor instead')
const JoinChannelRequest$json = {
  '1': 'JoinChannelRequest',
  '2': [
    {'1': 'server_id', '3': 1, '4': 1, '5': 9, '10': 'serverId'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `JoinChannelRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinChannelRequestDescriptor = $convert.base64Decode(
    'ChJKb2luQ2hhbm5lbFJlcXVlc3QSGwoJc2VydmVyX2lkGAEgASgJUghzZXJ2ZXJJZBIdCgpjaG'
    'FubmVsX2lkGAIgASgJUgljaGFubmVsSWQSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklk');

@$core.Deprecated('Use joinChannelResponseDescriptor instead')
const JoinChannelResponse$json = {
  '1': 'JoinChannelResponse',
  '2': [
    {'1': 'users_state', '3': 1, '4': 1, '5': 11, '6': '.konfa.voice.v1.UsersState', '9': 0, '10': 'usersState'},
  ],
  '8': [
    {'1': 'state'},
  ],
};

/// Descriptor for `JoinChannelResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinChannelResponseDescriptor = $convert.base64Decode(
    'ChNKb2luQ2hhbm5lbFJlc3BvbnNlEj0KC3VzZXJzX3N0YXRlGAEgASgLMhoua29uZmEudm9pY2'
    'UudjEuVXNlcnNTdGF0ZUgAUgp1c2Vyc1N0YXRlQgcKBXN0YXRl');

@$core.Deprecated('Use usersStateDescriptor instead')
const UsersState$json = {
  '1': 'UsersState',
  '2': [
    {'1': 'user_ids', '3': 1, '4': 3, '5': 9, '10': 'userIds'},
  ],
};

/// Descriptor for `UsersState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersStateDescriptor = $convert.base64Decode(
    'CgpVc2Vyc1N0YXRlEhkKCHVzZXJfaWRzGAEgAygJUgd1c2VySWRz');

@$core.Deprecated('Use speakToChannelRequestDescriptor instead')
const SpeakToChannelRequest$json = {
  '1': 'SpeakToChannelRequest',
  '2': [
    {'1': 'voice_info', '3': 1, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceInfo', '9': 0, '10': 'voiceInfo'},
    {'1': 'voice_data', '3': 2, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceData', '9': 0, '10': 'voiceData'},
  ],
  '8': [
    {'1': 'request'},
  ],
};

/// Descriptor for `SpeakToChannelRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speakToChannelRequestDescriptor = $convert.base64Decode(
    'ChVTcGVha1RvQ2hhbm5lbFJlcXVlc3QSOgoKdm9pY2VfaW5mbxgBIAEoCzIZLmtvbmZhLnZvaW'
    'NlLnYxLlZvaWNlSW5mb0gAUgl2b2ljZUluZm8SOgoKdm9pY2VfZGF0YRgCIAEoCzIZLmtvbmZh'
    'LnZvaWNlLnYxLlZvaWNlRGF0YUgAUgl2b2ljZURhdGFCCQoHcmVxdWVzdA==');

@$core.Deprecated('Use speakToChannelResponseDescriptor instead')
const SpeakToChannelResponse$json = {
  '1': 'SpeakToChannelResponse',
};

/// Descriptor for `SpeakToChannelResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speakToChannelResponseDescriptor = $convert.base64Decode(
    'ChZTcGVha1RvQ2hhbm5lbFJlc3BvbnNl');

@$core.Deprecated('Use listenToUserRequestDescriptor instead')
const ListenToUserRequest$json = {
  '1': 'ListenToUserRequest',
  '2': [
    {'1': 'voice_info', '3': 1, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceInfo', '10': 'voiceInfo'},
  ],
};

/// Descriptor for `ListenToUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listenToUserRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0ZW5Ub1VzZXJSZXF1ZXN0EjgKCnZvaWNlX2luZm8YASABKAsyGS5rb25mYS52b2ljZS'
    '52MS5Wb2ljZUluZm9SCXZvaWNlSW5mbw==');

@$core.Deprecated('Use listenToUserResponseDescriptor instead')
const ListenToUserResponse$json = {
  '1': 'ListenToUserResponse',
  '2': [
    {'1': 'voice_info', '3': 1, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceInfo', '9': 0, '10': 'voiceInfo'},
    {'1': 'voice_data', '3': 2, '4': 1, '5': 11, '6': '.konfa.voice.v1.VoiceData', '9': 0, '10': 'voiceData'},
  ],
  '8': [
    {'1': 'response'},
  ],
};

/// Descriptor for `ListenToUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listenToUserResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0ZW5Ub1VzZXJSZXNwb25zZRI6Cgp2b2ljZV9pbmZvGAEgASgLMhkua29uZmEudm9pY2'
    'UudjEuVm9pY2VJbmZvSABSCXZvaWNlSW5mbxI6Cgp2b2ljZV9kYXRhGAIgASgLMhkua29uZmEu'
    'dm9pY2UudjEuVm9pY2VEYXRhSABSCXZvaWNlRGF0YUIKCghyZXNwb25zZQ==');

