// This is a generated file - do not edit.
//
// Generated from confa/node/v1/service.proto.

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

@$pb.GrpcServiceName('confa.node.v1.NodeService')
class NodeServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  NodeServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SupportedClientVersionsResponse> supportedClientVersions($0.SupportedClientVersionsRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$supportedClientVersions, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListAuthProvidersResponse> listAuthProviders($0.ListAuthProvidersRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$listAuthProviders, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserResponse> getUser($0.GetUserRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.CurrentUserResponse> currentUser($0.CurrentUserRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$currentUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListServersResponse> listServerIDs($0.ListServersRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$listServerIDs, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListVoiceRelaysResponse> listVoiceRelays($0.ListVoiceRelaysRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$listVoiceRelays, request, options: options);
  }

    // method descriptors

  static final _$supportedClientVersions = $grpc.ClientMethod<$0.SupportedClientVersionsRequest, $0.SupportedClientVersionsResponse>(
      '/confa.node.v1.NodeService/SupportedClientVersions',
      ($0.SupportedClientVersionsRequest value) => value.writeToBuffer(),
      $0.SupportedClientVersionsResponse.fromBuffer);
  static final _$listAuthProviders = $grpc.ClientMethod<$0.ListAuthProvidersRequest, $0.ListAuthProvidersResponse>(
      '/confa.node.v1.NodeService/ListAuthProviders',
      ($0.ListAuthProvidersRequest value) => value.writeToBuffer(),
      $0.ListAuthProvidersResponse.fromBuffer);
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.GetUserResponse>(
      '/confa.node.v1.NodeService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      $0.GetUserResponse.fromBuffer);
  static final _$currentUser = $grpc.ClientMethod<$0.CurrentUserRequest, $0.CurrentUserResponse>(
      '/confa.node.v1.NodeService/CurrentUser',
      ($0.CurrentUserRequest value) => value.writeToBuffer(),
      $0.CurrentUserResponse.fromBuffer);
  static final _$listServerIDs = $grpc.ClientMethod<$0.ListServersRequest, $0.ListServersResponse>(
      '/confa.node.v1.NodeService/ListServerIDs',
      ($0.ListServersRequest value) => value.writeToBuffer(),
      $0.ListServersResponse.fromBuffer);
  static final _$listVoiceRelays = $grpc.ClientMethod<$0.ListVoiceRelaysRequest, $0.ListVoiceRelaysResponse>(
      '/confa.node.v1.NodeService/ListVoiceRelays',
      ($0.ListVoiceRelaysRequest value) => value.writeToBuffer(),
      $0.ListVoiceRelaysResponse.fromBuffer);
}

@$pb.GrpcServiceName('confa.node.v1.NodeService')
abstract class NodeServiceBase extends $grpc.Service {
  $core.String get $name => 'confa.node.v1.NodeService';

  NodeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SupportedClientVersionsRequest, $0.SupportedClientVersionsResponse>(
        'SupportedClientVersions',
        supportedClientVersions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupportedClientVersionsRequest.fromBuffer(value),
        ($0.SupportedClientVersionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListAuthProvidersRequest, $0.ListAuthProvidersResponse>(
        'ListAuthProviders',
        listAuthProviders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListAuthProvidersRequest.fromBuffer(value),
        ($0.ListAuthProvidersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CurrentUserRequest, $0.CurrentUserResponse>(
        'CurrentUser',
        currentUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CurrentUserRequest.fromBuffer(value),
        ($0.CurrentUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListServersRequest, $0.ListServersResponse>(
        'ListServerIDs',
        listServerIDs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListServersRequest.fromBuffer(value),
        ($0.ListServersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListVoiceRelaysRequest, $0.ListVoiceRelaysResponse>(
        'ListVoiceRelays',
        listVoiceRelays_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListVoiceRelaysRequest.fromBuffer(value),
        ($0.ListVoiceRelaysResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SupportedClientVersionsResponse> supportedClientVersions_Pre($grpc.ServiceCall $call, $async.Future<$0.SupportedClientVersionsRequest> $request) async {
    return supportedClientVersions($call, await $request);
  }

  $async.Future<$0.SupportedClientVersionsResponse> supportedClientVersions($grpc.ServiceCall call, $0.SupportedClientVersionsRequest request);

  $async.Future<$0.ListAuthProvidersResponse> listAuthProviders_Pre($grpc.ServiceCall $call, $async.Future<$0.ListAuthProvidersRequest> $request) async {
    return listAuthProviders($call, await $request);
  }

  $async.Future<$0.ListAuthProvidersResponse> listAuthProviders($grpc.ServiceCall call, $0.ListAuthProvidersRequest request);

  $async.Future<$0.GetUserResponse> getUser_Pre($grpc.ServiceCall $call, $async.Future<$0.GetUserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$0.GetUserResponse> getUser($grpc.ServiceCall call, $0.GetUserRequest request);

  $async.Future<$0.CurrentUserResponse> currentUser_Pre($grpc.ServiceCall $call, $async.Future<$0.CurrentUserRequest> $request) async {
    return currentUser($call, await $request);
  }

  $async.Future<$0.CurrentUserResponse> currentUser($grpc.ServiceCall call, $0.CurrentUserRequest request);

  $async.Future<$0.ListServersResponse> listServerIDs_Pre($grpc.ServiceCall $call, $async.Future<$0.ListServersRequest> $request) async {
    return listServerIDs($call, await $request);
  }

  $async.Future<$0.ListServersResponse> listServerIDs($grpc.ServiceCall call, $0.ListServersRequest request);

  $async.Future<$0.ListVoiceRelaysResponse> listVoiceRelays_Pre($grpc.ServiceCall $call, $async.Future<$0.ListVoiceRelaysRequest> $request) async {
    return listVoiceRelays($call, await $request);
  }

  $async.Future<$0.ListVoiceRelaysResponse> listVoiceRelays($grpc.ServiceCall call, $0.ListVoiceRelaysRequest request);

}
