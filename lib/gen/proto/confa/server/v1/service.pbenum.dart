//
//  Generated code. Do not modify.
//  source: confa/server/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateChannelRequest_ChannelType extends $pb.ProtobufEnum {
  static const CreateChannelRequest_ChannelType TEXT = CreateChannelRequest_ChannelType._(0, _omitEnumNames ? '' : 'TEXT');
  static const CreateChannelRequest_ChannelType VOICE = CreateChannelRequest_ChannelType._(1, _omitEnumNames ? '' : 'VOICE');

  static const $core.List<CreateChannelRequest_ChannelType> values = <CreateChannelRequest_ChannelType> [
    TEXT,
    VOICE,
  ];

  static final $core.Map<$core.int, CreateChannelRequest_ChannelType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CreateChannelRequest_ChannelType? valueOf($core.int value) => _byValue[value];

  const CreateChannelRequest_ChannelType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
