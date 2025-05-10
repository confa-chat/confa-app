//
//  Generated code. Do not modify.
//  source: konfa/voice_relay/v1/voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

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

  static final $core.Map<$core.int, AudioCodec> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AudioCodec? valueOf($core.int value) => _byValue[value];

  const AudioCodec._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
