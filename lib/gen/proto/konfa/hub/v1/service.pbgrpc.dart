//
//  Generated code. Do not modify.
//  source: konfa/hub/v1/service.proto
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

@$pb.GrpcServiceName('konfa.hub.v1.HubService')
class HubServiceClient extends $grpc.Client {
  static final _$getUser = $grpc.ClientMethod<$1.GetUserRequest, $1.GetUserResponse>(
      '/konfa.hub.v1.HubService/GetUser',
      ($1.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetUserResponse.fromBuffer(value));
  static final _$currentUser = $grpc.ClientMethod<$1.CurrentUserRequest, $1.CurrentUserResponse>(
      '/konfa.hub.v1.HubService/CurrentUser',
      ($1.CurrentUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CurrentUserResponse.fromBuffer(value));
  static final _$listServerIDs = $grpc.ClientMethod<$1.ListServersRequest, $1.ListServersResponse>(
      '/konfa.hub.v1.HubService/ListServerIDs',
      ($1.ListServersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListServersResponse.fromBuffer(value));
  static final _$listVoiceRelays = $grpc.ClientMethod<$1.ListVoiceRelaysRequest, $1.ListVoiceRelaysResponse>(
      '/konfa.hub.v1.HubService/ListVoiceRelays',
      ($1.ListVoiceRelaysRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListVoiceRelaysResponse.fromBuffer(value));
  static final _$listAuthProviders = $grpc.ClientMethod<$1.ListAuthProvidersRequest, $1.ListAuthProvidersResponse>(
      '/konfa.hub.v1.HubService/ListAuthProviders',
      ($1.ListAuthProvidersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListAuthProvidersResponse.fromBuffer(value));

  HubServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetUserResponse> getUser($1.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.CurrentUserResponse> currentUser($1.CurrentUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$currentUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListServersResponse> listServerIDs($1.ListServersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServerIDs, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListVoiceRelaysResponse> listVoiceRelays($1.ListVoiceRelaysRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listVoiceRelays, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListAuthProvidersResponse> listAuthProviders($1.ListAuthProvidersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAuthProviders, request, options: options);
  }
}

@$pb.GrpcServiceName('konfa.hub.v1.HubService')
abstract class HubServiceBase extends $grpc.Service {
  $core.String get $name => 'konfa.hub.v1.HubService';

  HubServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GetUserRequest, $1.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetUserRequest.fromBuffer(value),
        ($1.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CurrentUserRequest, $1.CurrentUserResponse>(
        'CurrentUser',
        currentUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CurrentUserRequest.fromBuffer(value),
        ($1.CurrentUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListServersRequest, $1.ListServersResponse>(
        'ListServerIDs',
        listServerIDs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListServersRequest.fromBuffer(value),
        ($1.ListServersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListVoiceRelaysRequest, $1.ListVoiceRelaysResponse>(
        'ListVoiceRelays',
        listVoiceRelays_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListVoiceRelaysRequest.fromBuffer(value),
        ($1.ListVoiceRelaysResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListAuthProvidersRequest, $1.ListAuthProvidersResponse>(
        'ListAuthProviders',
        listAuthProviders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListAuthProvidersRequest.fromBuffer(value),
        ($1.ListAuthProvidersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetUserResponse> getUser_Pre($grpc.ServiceCall call, $async.Future<$1.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$1.CurrentUserResponse> currentUser_Pre($grpc.ServiceCall call, $async.Future<$1.CurrentUserRequest> request) async {
    return currentUser(call, await request);
  }

  $async.Future<$1.ListServersResponse> listServerIDs_Pre($grpc.ServiceCall call, $async.Future<$1.ListServersRequest> request) async {
    return listServerIDs(call, await request);
  }

  $async.Future<$1.ListVoiceRelaysResponse> listVoiceRelays_Pre($grpc.ServiceCall call, $async.Future<$1.ListVoiceRelaysRequest> request) async {
    return listVoiceRelays(call, await request);
  }

  $async.Future<$1.ListAuthProvidersResponse> listAuthProviders_Pre($grpc.ServiceCall call, $async.Future<$1.ListAuthProvidersRequest> request) async {
    return listAuthProviders(call, await request);
  }

  $async.Future<$1.GetUserResponse> getUser($grpc.ServiceCall call, $1.GetUserRequest request);
  $async.Future<$1.CurrentUserResponse> currentUser($grpc.ServiceCall call, $1.CurrentUserRequest request);
  $async.Future<$1.ListServersResponse> listServerIDs($grpc.ServiceCall call, $1.ListServersRequest request);
  $async.Future<$1.ListVoiceRelaysResponse> listVoiceRelays($grpc.ServiceCall call, $1.ListVoiceRelaysRequest request);
  $async.Future<$1.ListAuthProvidersResponse> listAuthProviders($grpc.ServiceCall call, $1.ListAuthProvidersRequest request);
}
