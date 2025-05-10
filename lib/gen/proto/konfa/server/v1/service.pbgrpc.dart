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
  static final _$getUser = $grpc.ClientMethod<$2.GetUserRequest, $2.GetUserResponse>(
      '/konfa.server.v1.ServerService/GetUser',
      ($2.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetUserResponse.fromBuffer(value));
  static final _$currentUser = $grpc.ClientMethod<$2.CurrentUserRequest, $2.CurrentUserResponse>(
      '/konfa.server.v1.ServerService/CurrentUser',
      ($2.CurrentUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CurrentUserResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$2.GetUserResponse> getUser($2.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$2.CurrentUserResponse> currentUser($2.CurrentUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$currentUser, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$2.GetUserRequest, $2.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetUserRequest.fromBuffer(value),
        ($2.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CurrentUserRequest, $2.CurrentUserResponse>(
        'CurrentUser',
        currentUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CurrentUserRequest.fromBuffer(value),
        ($2.CurrentUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.ListServerChannelsResponse> listServerChannels_Pre($grpc.ServiceCall call, $async.Future<$2.ListServerChannelsRequest> request) async {
    return listServerChannels(call, await request);
  }

  $async.Future<$2.ListServerUsersResponse> listServerUsers_Pre($grpc.ServiceCall call, $async.Future<$2.ListServerUsersRequest> request) async {
    return listServerUsers(call, await request);
  }

  $async.Future<$2.GetUserResponse> getUser_Pre($grpc.ServiceCall call, $async.Future<$2.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$2.CurrentUserResponse> currentUser_Pre($grpc.ServiceCall call, $async.Future<$2.CurrentUserRequest> request) async {
    return currentUser(call, await request);
  }

  $async.Future<$2.ListServerChannelsResponse> listServerChannels($grpc.ServiceCall call, $2.ListServerChannelsRequest request);
  $async.Future<$2.ListServerUsersResponse> listServerUsers($grpc.ServiceCall call, $2.ListServerUsersRequest request);
  $async.Future<$2.GetUserResponse> getUser($grpc.ServiceCall call, $2.GetUserRequest request);
  $async.Future<$2.CurrentUserResponse> currentUser($grpc.ServiceCall call, $2.CurrentUserRequest request);
}
