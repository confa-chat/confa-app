// This is a generated file - do not edit.
//
// Generated from confa/chat/v1/service.proto.

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

@$pb.GrpcServiceName('confa.chat.v1.ChatService')
class ChatServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SendMessageResponse> sendMessage($0.SendMessageRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMessageHistoryResponse> getMessageHistory($0.GetMessageHistoryRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getMessageHistory, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMessageResponse> getMessage($0.GetMessageRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getMessage, request, options: options);
  }

  $grpc.ResponseStream<$0.StreamNewMessagesResponse> streamNewMessages($0.StreamNewMessagesRequest request, {$grpc.CallOptions? options,}) {
    return $createStreamingCall(_$streamNewMessages, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.UploadAttachmentResponse> uploadAttachment($async.Stream<$0.UploadAttachmentRequest> request, {$grpc.CallOptions? options,}) {
    return $createStreamingCall(_$uploadAttachment, request, options: options).single;
  }

    // method descriptors

  static final _$sendMessage = $grpc.ClientMethod<$0.SendMessageRequest, $0.SendMessageResponse>(
      '/confa.chat.v1.ChatService/SendMessage',
      ($0.SendMessageRequest value) => value.writeToBuffer(),
      $0.SendMessageResponse.fromBuffer);
  static final _$getMessageHistory = $grpc.ClientMethod<$0.GetMessageHistoryRequest, $0.GetMessageHistoryResponse>(
      '/confa.chat.v1.ChatService/GetMessageHistory',
      ($0.GetMessageHistoryRequest value) => value.writeToBuffer(),
      $0.GetMessageHistoryResponse.fromBuffer);
  static final _$getMessage = $grpc.ClientMethod<$0.GetMessageRequest, $0.GetMessageResponse>(
      '/confa.chat.v1.ChatService/GetMessage',
      ($0.GetMessageRequest value) => value.writeToBuffer(),
      $0.GetMessageResponse.fromBuffer);
  static final _$streamNewMessages = $grpc.ClientMethod<$0.StreamNewMessagesRequest, $0.StreamNewMessagesResponse>(
      '/confa.chat.v1.ChatService/StreamNewMessages',
      ($0.StreamNewMessagesRequest value) => value.writeToBuffer(),
      $0.StreamNewMessagesResponse.fromBuffer);
  static final _$uploadAttachment = $grpc.ClientMethod<$0.UploadAttachmentRequest, $0.UploadAttachmentResponse>(
      '/confa.chat.v1.ChatService/UploadAttachment',
      ($0.UploadAttachmentRequest value) => value.writeToBuffer(),
      $0.UploadAttachmentResponse.fromBuffer);
}

@$pb.GrpcServiceName('confa.chat.v1.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'confa.chat.v1.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendMessageRequest, $0.SendMessageResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendMessageRequest.fromBuffer(value),
        ($0.SendMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMessageHistoryRequest, $0.GetMessageHistoryResponse>(
        'GetMessageHistory',
        getMessageHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMessageHistoryRequest.fromBuffer(value),
        ($0.GetMessageHistoryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMessageRequest, $0.GetMessageResponse>(
        'GetMessage',
        getMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMessageRequest.fromBuffer(value),
        ($0.GetMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamNewMessagesRequest, $0.StreamNewMessagesResponse>(
        'StreamNewMessages',
        streamNewMessages_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StreamNewMessagesRequest.fromBuffer(value),
        ($0.StreamNewMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UploadAttachmentRequest, $0.UploadAttachmentResponse>(
        'UploadAttachment',
        uploadAttachment,
        true,
        false,
        ($core.List<$core.int> value) => $0.UploadAttachmentRequest.fromBuffer(value),
        ($0.UploadAttachmentResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SendMessageResponse> sendMessage_Pre($grpc.ServiceCall $call, $async.Future<$0.SendMessageRequest> $request) async {
    return sendMessage($call, await $request);
  }

  $async.Future<$0.SendMessageResponse> sendMessage($grpc.ServiceCall call, $0.SendMessageRequest request);

  $async.Future<$0.GetMessageHistoryResponse> getMessageHistory_Pre($grpc.ServiceCall $call, $async.Future<$0.GetMessageHistoryRequest> $request) async {
    return getMessageHistory($call, await $request);
  }

  $async.Future<$0.GetMessageHistoryResponse> getMessageHistory($grpc.ServiceCall call, $0.GetMessageHistoryRequest request);

  $async.Future<$0.GetMessageResponse> getMessage_Pre($grpc.ServiceCall $call, $async.Future<$0.GetMessageRequest> $request) async {
    return getMessage($call, await $request);
  }

  $async.Future<$0.GetMessageResponse> getMessage($grpc.ServiceCall call, $0.GetMessageRequest request);

  $async.Stream<$0.StreamNewMessagesResponse> streamNewMessages_Pre($grpc.ServiceCall $call, $async.Future<$0.StreamNewMessagesRequest> $request) async* {
    yield* streamNewMessages($call, await $request);
  }

  $async.Stream<$0.StreamNewMessagesResponse> streamNewMessages($grpc.ServiceCall call, $0.StreamNewMessagesRequest request);

  $async.Future<$0.UploadAttachmentResponse> uploadAttachment($grpc.ServiceCall call, $async.Stream<$0.UploadAttachmentRequest> request);

}
