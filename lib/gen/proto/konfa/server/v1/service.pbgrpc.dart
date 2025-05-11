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

import 'service.pb.dart' as $2;

export 'service.pb.dart';

@$pb.GrpcServiceName('konfa.server.v1.ServerService')
class ServerServiceClient extends $grpc.Client {
  static final _$listServerChannels = $grpc.ClientMethod<$2.ListServerChannelsRequest, $2.ListServerChannelsResponse>(
      '/konfa.server.v1.ServerService/ListServerChannels',
      ($2.ListServerChannelsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListServerChannelsResponse.fromBuffer(value));
  static final _$listServerUsers = $grpc.ClientMethod<$2.ListServerUsersRequest, $2.ListServerUsersResponse>(
      '/konfa.server.v1.ServerService/ListServerUsers',
      ($2.ListServerUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListServerUsersResponse.fromBuffer(value));
  static final _$createChannel = $grpc.ClientMethod<$2.CreateChannelRequest, $2.CreateChannelResponse>(
      '/konfa.server.v1.ServerService/CreateChannel',
      ($2.CreateChannelRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CreateChannelResponse.fromBuffer(value));

  ServerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.ListServerChannelsResponse> listServerChannels($2.ListServerChannelsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServerChannels, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListServerUsersResponse> listServerUsers($2.ListServerUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServerUsers, request, options: options);
  }

  $grpc.ResponseFuture<$2.CreateChannelResponse> createChannel($2.CreateChannelRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChannel, request, options: options);
  }
}

@$pb.GrpcServiceName('konfa.server.v1.ServerService')
abstract class ServerServiceBase extends $grpc.Service {
  $core.String get $name => 'konfa.server.v1.ServerService';

  ServerServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ListServerChannelsRequest, $2.ListServerChannelsResponse>(
        'ListServerChannels',
        listServerChannels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListServerChannelsRequest.fromBuffer(value),
        ($2.ListServerChannelsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListServerUsersRequest, $2.ListServerUsersResponse>(
        'ListServerUsers',
        listServerUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListServerUsersRequest.fromBuffer(value),
        ($2.ListServerUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreateChannelRequest, $2.CreateChannelResponse>(
        'CreateChannel',
        createChannel_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateChannelRequest.fromBuffer(value),
        ($2.CreateChannelResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.ListServerChannelsResponse> listServerChannels_Pre($grpc.ServiceCall call, $async.Future<$2.ListServerChannelsRequest> request) async {
    return listServerChannels(call, await request);
  }

  $async.Future<$2.ListServerUsersResponse> listServerUsers_Pre($grpc.ServiceCall call, $async.Future<$2.ListServerUsersRequest> request) async {
    return listServerUsers(call, await request);
  }

  $async.Future<$2.CreateChannelResponse> createChannel_Pre($grpc.ServiceCall call, $async.Future<$2.CreateChannelRequest> request) async {
    return createChannel(call, await request);
  }

  $async.Future<$2.ListServerChannelsResponse> listServerChannels($grpc.ServiceCall call, $2.ListServerChannelsRequest request);
  $async.Future<$2.ListServerUsersResponse> listServerUsers($grpc.ServiceCall call, $2.ListServerUsersRequest request);
  $async.Future<$2.CreateChannelResponse> createChannel($grpc.ServiceCall call, $2.CreateChannelRequest request);
}
