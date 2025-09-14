// This is a generated file - do not edit.
//
// Generated from confa/voice/v1/voice.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AudioCodec extends $pb.ProtobufEnum {
  static const AudioCodec AUDIO_CODEC_UNSPECIFIED = AudioCodec._(0, _omitEnumNames ? '' : 'AUDIO_CODEC_UNSPECIFIED');
  static const AudioCodec AUDIO_CODEC_PCM_F32 = AudioCodec._(1, _omitEnumNames ? '' : 'AUDIO_CODEC_PCM_F32');
  static const AudioCodec AUDIO_CODEC_OPUS = AudioCodec._(2, _omitEnumNames ? '' : 'AUDIO_CODEC_OPUS');

  static const $core.List<AudioCodec> values = <AudioCodec> [
    AUDIO_CODEC_UNSPECIFIED,
    AUDIO_CODEC_PCM_F32,
    AUDIO_CODEC_OPUS,
  ];

  static final $core.List<AudioCodec?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AudioCodec? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AudioCodec._(super.value, super.name);
}


const $core.bool _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
