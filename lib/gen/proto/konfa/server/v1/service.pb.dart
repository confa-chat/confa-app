//
//  Generated code. Do not modify.
//  source: konfa/server/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../channel/v1/channels.pb.dart' as $3;

class ListServerChannelsRequest extends $pb.GeneratedMessage {
  factory ListServerChannelsRequest({
    $core.String? serverId,
  }) {
    final $result = create();
    if (serverId != null) {
      $result.serverId = serverId;
    }
    return $result;
  }
  ListServerChannelsRequest._() : super();
  factory ListServerChannelsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListServerChannelsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServerChannelsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.server.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListServerChannelsRequest clone() => ListServerChannelsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListServerChannelsRequest copyWith(void Function(ListServerChannelsRequest) updates) => super.copyWith((message) => updates(message as ListServerChannelsRequest)) as ListServerChannelsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServerChannelsRequest create() => ListServerChannelsRequest._();
  ListServerChannelsRequest createEmptyInstance() => create();
  static $pb.PbList<ListServerChannelsRequest> createRepeated() => $pb.PbList<ListServerChannelsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListServerChannelsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServerChannelsRequest>(create);
  static ListServerChannelsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => clearField(1);
}

class ListServerChannelsResponse extends $pb.GeneratedMessage {
  factory ListServerChannelsResponse({
    $core.Iterable<$3.Channel>? channels,
  }) {
    final $result = create();
    if (channels != null) {
      $result.channels.addAll(channels);
    }
    return $result;
  }
  ListServerChannelsResponse._() : super();
  factory ListServerChannelsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListServerChannelsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServerChannelsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'konfa.server.v1'), createEmptyInstance: create)
    ..pc<$3.Channel>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.PM, subBuilder: $3.Channel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListServerChannelsResponse clone() => ListServerChannelsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListServerChannelsResponse copyWith(void Function(ListServerChannelsResponse) updates) => super.copyWith((message) => updates(message as ListServerChannelsResponse)) as ListServerChannelsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServerChannelsResponse create() => ListServerChannelsResponse._();
  ListServerChannelsResponse createEmptyInstance() => create();
  static $pb.PbList<ListServerChannelsResponse> createRepeated() => $pb.PbList<ListServerChannelsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListServerChannelsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServerChannelsResponse>(create);
  static ListServerChannelsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Channel> get channels => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
