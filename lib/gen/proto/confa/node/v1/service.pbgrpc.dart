//
//  Generated code. Do not modify.
//  source: confa/node/v1/service.proto
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

@$pb.GrpcServiceName('confa.node.v1.NodeService')
class NodeServiceClient extends $grpc.Client {
  static final _$supportedClientVersions = $grpc.ClientMethod<$1.SupportedClientVersionsRequest, $1.SupportedClientVersionsResponse>(
      '/confa.node.v1.NodeService/SupportedClientVersions',
      ($1.SupportedClientVersionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SupportedClientVersionsResponse.fromBuffer(value));
  static final _$listAuthProviders = $grpc.ClientMethod<$1.ListAuthProvidersRequest, $1.ListAuthProvidersResponse>(
      '/confa.node.v1.NodeService/ListAuthProviders',
      ($1.ListAuthProvidersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListAuthProvidersResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$1.GetUserRequest, $1.GetUserResponse>(
      '/confa.node.v1.NodeService/GetUser',
      ($1.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetUserResponse.fromBuffer(value));
  static final _$currentUser = $grpc.ClientMethod<$1.CurrentUserRequest, $1.CurrentUserResponse>(
      '/confa.node.v1.NodeService/CurrentUser',
      ($1.CurrentUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CurrentUserResponse.fromBuffer(value));
  static final _$listServerIDs = $grpc.ClientMethod<$1.ListServersRequest, $1.ListServersResponse>(
      '/confa.node.v1.NodeService/ListServerIDs',
      ($1.ListServersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListServersResponse.fromBuffer(value));
  static final _$listVoiceRelays = $grpc.ClientMethod<$1.ListVoiceRelaysRequest, $1.ListVoiceRelaysResponse>(
      '/confa.node.v1.NodeService/ListVoiceRelays',
      ($1.ListVoiceRelaysRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListVoiceRelaysResponse.fromBuffer(value));

  NodeServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.SupportedClientVersionsResponse> supportedClientVersions($1.SupportedClientVersionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$supportedClientVersions, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListAuthProvidersResponse> listAuthProviders($1.ListAuthProvidersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAuthProviders, request, options: options);
  }

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
}

@$pb.GrpcServiceName('confa.node.v1.NodeService')
abstract class NodeServiceBase extends $grpc.Service {
  $core.String get $name => 'confa.node.v1.NodeService';

  NodeServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.SupportedClientVersionsRequest, $1.SupportedClientVersionsResponse>(
        'SupportedClientVersions',
        supportedClientVersions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SupportedClientVersionsRequest.fromBuffer(value),
        ($1.SupportedClientVersionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListAuthProvidersRequest, $1.ListAuthProvidersResponse>(
        'ListAuthProviders',
        listAuthProviders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListAuthProvidersRequest.fromBuffer(value),
        ($1.ListAuthProvidersResponse value) => value.writeToBuffer()));
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
  }

  $async.Future<$1.SupportedClientVersionsResponse> supportedClientVersions_Pre($grpc.ServiceCall call, $async.Future<$1.SupportedClientVersionsRequest> request) async {
    return supportedClientVersions(call, await request);
  }

  $async.Future<$1.ListAuthProvidersResponse> listAuthProviders_Pre($grpc.ServiceCall call, $async.Future<$1.ListAuthProvidersRequest> request) async {
    return listAuthProviders(call, await request);
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

  $async.Future<$1.SupportedClientVersionsResponse> supportedClientVersions($grpc.ServiceCall call, $1.SupportedClientVersionsRequest request);
  $async.Future<$1.ListAuthProvidersResponse> listAuthProviders($grpc.ServiceCall call, $1.ListAuthProvidersRequest request);
  $async.Future<$1.GetUserResponse> getUser($grpc.ServiceCall call, $1.GetUserRequest request);
  $async.Future<$1.CurrentUserResponse> currentUser($grpc.ServiceCall call, $1.CurrentUserRequest request);
  $async.Future<$1.ListServersResponse> listServerIDs($grpc.ServiceCall call, $1.ListServersRequest request);
  $async.Future<$1.ListVoiceRelaysResponse> listVoiceRelays($grpc.ServiceCall call, $1.ListVoiceRelaysRequest request);
}
