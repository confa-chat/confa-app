// This is a generated file - do not edit.
//
// Generated from confa/server/v1/service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'service.pb.dart' as $0;

export 'service.pb.dart';

@$pb.GrpcServiceName('confa.server.v1.ServerService')
class ServerServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ServerServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ListChannelsResponse> listChannels($0.ListChannelsRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$listChannels, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUsersResponse> listUsers($0.ListUsersRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateChannelResponse> createChannel($0.CreateChannelRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$createChannel, request, options: options);
  }

  $grpc.ResponseFuture<$0.EditChannelResponse> editChannel($0.EditChannelRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$editChannel, request, options: options);
  }

    // method descriptors

  static final _$listChannels = $grpc.ClientMethod<$0.ListChannelsRequest, $0.ListChannelsResponse>(
      '/confa.server.v1.ServerService/ListChannels',
      ($0.ListChannelsRequest value) => value.writeToBuffer(),
      $0.ListChannelsResponse.fromBuffer);
  static final _$listUsers = $grpc.ClientMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
      '/confa.server.v1.ServerService/ListUsers',
      ($0.ListUsersRequest value) => value.writeToBuffer(),
      $0.ListUsersResponse.fromBuffer);
  static final _$createChannel = $grpc.ClientMethod<$0.CreateChannelRequest, $0.CreateChannelResponse>(
      '/confa.server.v1.ServerService/CreateChannel',
      ($0.CreateChannelRequest value) => value.writeToBuffer(),
      $0.CreateChannelResponse.fromBuffer);
  static final _$editChannel = $grpc.ClientMethod<$0.EditChannelRequest, $0.EditChannelResponse>(
      '/confa.server.v1.ServerService/EditChannel',
      ($0.EditChannelRequest value) => value.writeToBuffer(),
      $0.EditChannelResponse.fromBuffer);
}

@$pb.GrpcServiceName('confa.server.v1.ServerService')
abstract class ServerServiceBase extends $grpc.Service {
  $core.String get $name => 'confa.server.v1.ServerService';

  ServerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListChannelsRequest, $0.ListChannelsResponse>(
        'ListChannels',
        listChannels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListChannelsRequest.fromBuffer(value),
        ($0.ListChannelsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListUsersRequest.fromBuffer(value),
        ($0.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateChannelRequest, $0.CreateChannelResponse>(
        'CreateChannel',
        createChannel_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateChannelRequest.fromBuffer(value),
        ($0.CreateChannelResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditChannelRequest, $0.EditChannelResponse>(
        'EditChannel',
        editChannel_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditChannelRequest.fromBuffer(value),
        ($0.EditChannelResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListChannelsResponse> listChannels_Pre($grpc.ServiceCall $call, $async.Future<$0.ListChannelsRequest> $request) async {
    return listChannels($call, await $request);
  }

  $async.Future<$0.ListChannelsResponse> listChannels($grpc.ServiceCall call, $0.ListChannelsRequest request);

  $async.Future<$0.ListUsersResponse> listUsers_Pre($grpc.ServiceCall $call, $async.Future<$0.ListUsersRequest> $request) async {
    return listUsers($call, await $request);
  }

  $async.Future<$0.ListUsersResponse> listUsers($grpc.ServiceCall call, $0.ListUsersRequest request);

  $async.Future<$0.CreateChannelResponse> createChannel_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateChannelRequest> $request) async {
    return createChannel($call, await $request);
  }

  $async.Future<$0.CreateChannelResponse> createChannel($grpc.ServiceCall call, $0.CreateChannelRequest request);

  $async.Future<$0.EditChannelResponse> editChannel_Pre($grpc.ServiceCall $call, $async.Future<$0.EditChannelRequest> $request) async {
    return editChannel($call, await $request);
  }

  $async.Future<$0.EditChannelResponse> editChannel($grpc.ServiceCall call, $0.EditChannelRequest request);

}
