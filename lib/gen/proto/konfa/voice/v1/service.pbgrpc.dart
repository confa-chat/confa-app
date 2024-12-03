//
//  Generated code. Do not modify.
//  source: konfa/voice/v1/service.proto
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

import 'service.pb.dart' as $0;

export 'service.pb.dart';

@$pb.GrpcServiceName('konfa.voice.v1.VoiceService')
class VoiceServiceClient extends $grpc.Client {
  static final _$send = $grpc.ClientMethod<$0.SendRequest, $0.SendResponse>(
      '/konfa.voice.v1.VoiceService/Send',
      ($0.SendRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendResponse.fromBuffer(value));
  static final _$receive = $grpc.ClientMethod<$0.ReceiveRequest, $0.ReceiveResponse>(
      '/konfa.voice.v1.VoiceService/Receive',
      ($0.ReceiveRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReceiveResponse.fromBuffer(value));
  static final _$subscribeChannelState = $grpc.ClientMethod<$0.SubscribeChannelStateRequest, $0.SubscribeChannelStateResponse>(
      '/konfa.voice.v1.VoiceService/SubscribeChannelState',
      ($0.SubscribeChannelStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SubscribeChannelStateResponse.fromBuffer(value));

  VoiceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SendResponse> send($async.Stream<$0.SendRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$send, request, options: options).single;
  }

  $grpc.ResponseStream<$0.ReceiveResponse> receive($0.ReceiveRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$receive, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.SubscribeChannelStateResponse> subscribeChannelState($0.SubscribeChannelStateRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeChannelState, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('konfa.voice.v1.VoiceService')
abstract class VoiceServiceBase extends $grpc.Service {
  $core.String get $name => 'konfa.voice.v1.VoiceService';

  VoiceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendRequest, $0.SendResponse>(
        'Send',
        send,
        true,
        false,
        ($core.List<$core.int> value) => $0.SendRequest.fromBuffer(value),
        ($0.SendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReceiveRequest, $0.ReceiveResponse>(
        'Receive',
        receive_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ReceiveRequest.fromBuffer(value),
        ($0.ReceiveResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubscribeChannelStateRequest, $0.SubscribeChannelStateResponse>(
        'SubscribeChannelState',
        subscribeChannelState_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SubscribeChannelStateRequest.fromBuffer(value),
        ($0.SubscribeChannelStateResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ReceiveResponse> receive_Pre($grpc.ServiceCall call, $async.Future<$0.ReceiveRequest> request) async* {
    yield* receive(call, await request);
  }

  $async.Stream<$0.SubscribeChannelStateResponse> subscribeChannelState_Pre($grpc.ServiceCall call, $async.Future<$0.SubscribeChannelStateRequest> request) async* {
    yield* subscribeChannelState(call, await request);
  }

  $async.Future<$0.SendResponse> send($grpc.ServiceCall call, $async.Stream<$0.SendRequest> request);
  $async.Stream<$0.ReceiveResponse> receive($grpc.ServiceCall call, $0.ReceiveRequest request);
  $async.Stream<$0.SubscribeChannelStateResponse> subscribeChannelState($grpc.ServiceCall call, $0.SubscribeChannelStateRequest request);
}
