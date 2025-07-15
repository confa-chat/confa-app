// This is a generated file - do not edit.
//
// Generated from confa/server/v1/service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateChannelRequest_ChannelType extends $pb.ProtobufEnum {
  static const CreateChannelRequest_ChannelType TEXT = CreateChannelRequest_ChannelType._(0, _omitEnumNames ? '' : 'TEXT');
  static const CreateChannelRequest_ChannelType VOICE = CreateChannelRequest_ChannelType._(1, _omitEnumNames ? '' : 'VOICE');

  static const $core.List<CreateChannelRequest_ChannelType> values = <CreateChannelRequest_ChannelType> [
    TEXT,
    VOICE,
  ];

  static final $core.List<CreateChannelRequest_ChannelType?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 1);
  static CreateChannelRequest_ChannelType? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CreateChannelRequest_ChannelType._(super.value, super.name);
}

class EditChannelRequest_ChannelType extends $pb.ProtobufEnum {
  static const EditChannelRequest_ChannelType TEXT = EditChannelRequest_ChannelType._(0, _omitEnumNames ? '' : 'TEXT');
  static const EditChannelRequest_ChannelType VOICE = EditChannelRequest_ChannelType._(1, _omitEnumNames ? '' : 'VOICE');

  static const $core.List<EditChannelRequest_ChannelType> values = <EditChannelRequest_ChannelType> [
    TEXT,
    VOICE,
  ];

  static final $core.List<EditChannelRequest_ChannelType?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 1);
  static EditChannelRequest_ChannelType? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EditChannelRequest_ChannelType._(super.value, super.name);
}


const $core.bool _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
