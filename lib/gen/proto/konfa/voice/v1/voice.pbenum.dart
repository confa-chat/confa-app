//
//  Generated code. Do not modify.
//  source: konfa/voice/v1/voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Codec extends $pb.ProtobufEnum {
  static const Codec CODEC_UNSPECIFIED = Codec._(0, _omitEnumNames ? '' : 'CODEC_UNSPECIFIED');
  static const Codec CODEC_PCM_F32 = Codec._(1, _omitEnumNames ? '' : 'CODEC_PCM_F32');
  static const Codec CODEC_OPUS = Codec._(2, _omitEnumNames ? '' : 'CODEC_OPUS');

  static const $core.List<Codec> values = <Codec> [
    CODEC_UNSPECIFIED,
    CODEC_PCM_F32,
    CODEC_OPUS,
  ];

  static final $core.Map<$core.int, Codec> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Codec? valueOf($core.int value) => _byValue[value];

  const Codec._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
