//
//  Generated code. Do not modify.
//  source: konfa/server/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'service.pb.dart' as $1;

export 'service.pb.dart';

@$pb.GrpcServiceName('konfa.server.v1.ServerService')
class ServerServiceClient extends $grpc.Client {
  static final _$listServerChannels = $grpc.ClientMethod<$1.ListServerChannelsRequest, $1.ListServerChannelsResponse>(
      '/konfa.server.v1.ServerService/ListServerChannels',
      ($1.ListServerChannelsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListServerChannelsResponse.fromBuffer(value));

  ServerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.ListServerChannelsResponse> listServerChannels($1.ListServerChannelsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServerChannels, request, options: options);
  }
}

@$pb.GrpcServiceName('konfa.server.v1.ServerService')
abstract class ServerServiceBase extends $grpc.Service {
  $core.String get $name => 'konfa.server.v1.ServerService';

  ServerServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.ListServerChannelsRequest, $1.ListServerChannelsResponse>(
        'ListServerChannels',
        listServerChannels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListServerChannelsRequest.fromBuffer(value),
        ($1.ListServerChannelsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ListServerChannelsResponse> listServerChannels_Pre($grpc.ServiceCall call, $async.Future<$1.ListServerChannelsRequest> request) async {
    return listServerChannels(call, await request);
  }

  $async.Future<$1.ListServerChannelsResponse> listServerChannels($grpc.ServiceCall call, $1.ListServerChannelsRequest request);
}
