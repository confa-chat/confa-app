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
  static final _$listChannels = $grpc.ClientMethod<$2.ListChannelsRequest, $2.ListChannelsResponse>(
      '/konfa.server.v1.ServerService/ListChannels',
      ($2.ListChannelsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListChannelsResponse.fromBuffer(value));
  static final _$listUsers = $grpc.ClientMethod<$2.ListUsersRequest, $2.ListUsersResponse>(
      '/konfa.server.v1.ServerService/ListUsers',
      ($2.ListUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListUsersResponse.fromBuffer(value));
  static final _$createChannel = $grpc.ClientMethod<$2.CreateChannelRequest, $2.CreateChannelResponse>(
      '/konfa.server.v1.ServerService/CreateChannel',
      ($2.CreateChannelRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CreateChannelResponse.fromBuffer(value));

  ServerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.ListChannelsResponse> listChannels($2.ListChannelsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listChannels, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListUsersResponse> listUsers($2.ListUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$2.CreateChannelResponse> createChannel($2.CreateChannelRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChannel, request, options: options);
  }
}

@$pb.GrpcServiceName('konfa.server.v1.ServerService')
abstract class ServerServiceBase extends $grpc.Service {
  $core.String get $name => 'konfa.server.v1.ServerService';

  ServerServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ListChannelsRequest, $2.ListChannelsResponse>(
        'ListChannels',
        listChannels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListChannelsRequest.fromBuffer(value),
        ($2.ListChannelsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListUsersRequest, $2.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListUsersRequest.fromBuffer(value),
        ($2.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreateChannelRequest, $2.CreateChannelResponse>(
        'CreateChannel',
        createChannel_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateChannelRequest.fromBuffer(value),
        ($2.CreateChannelResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.ListChannelsResponse> listChannels_Pre($grpc.ServiceCall call, $async.Future<$2.ListChannelsRequest> request) async {
    return listChannels(call, await request);
  }

  $async.Future<$2.ListUsersResponse> listUsers_Pre($grpc.ServiceCall call, $async.Future<$2.ListUsersRequest> request) async {
    return listUsers(call, await request);
  }

  $async.Future<$2.CreateChannelResponse> createChannel_Pre($grpc.ServiceCall call, $async.Future<$2.CreateChannelRequest> request) async {
    return createChannel(call, await request);
  }

  $async.Future<$2.ListChannelsResponse> listChannels($grpc.ServiceCall call, $2.ListChannelsRequest request);
  $async.Future<$2.ListUsersResponse> listUsers($grpc.ServiceCall call, $2.ListUsersRequest request);
  $async.Future<$2.CreateChannelResponse> createChannel($grpc.ServiceCall call, $2.CreateChannelRequest request);
}
