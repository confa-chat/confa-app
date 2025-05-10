//
//  Generated code. Do not modify.
//  source: konfa/voice_relay/v1/service.proto
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

@$pb.GrpcServiceName('konfa.voice_relay.v1.VoiceRelayService')
class VoiceRelayServiceClient extends $grpc.Client {
  static final _$speakToChannel = $grpc.ClientMethod<$0.SpeakToChannelRequest, $0.SpeakToChannelResponse>(
      '/konfa.voice_relay.v1.VoiceRelayService/SpeakToChannel',
      ($0.SpeakToChannelRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SpeakToChannelResponse.fromBuffer(value));
  static final _$listenToUser = $grpc.ClientMethod<$0.ListenToUserRequest, $0.ListenToUserResponse>(
      '/konfa.voice_relay.v1.VoiceRelayService/ListenToUser',
      ($0.ListenToUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListenToUserResponse.fromBuffer(value));
  static final _$joinChannel = $grpc.ClientMethod<$0.JoinChannelRequest, $0.JoinChannelResponse>(
      '/konfa.voice_relay.v1.VoiceRelayService/JoinChannel',
      ($0.JoinChannelRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JoinChannelResponse.fromBuffer(value));

  VoiceRelayServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SpeakToChannelResponse> speakToChannel($async.Stream<$0.SpeakToChannelRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$speakToChannel, request, options: options).single;
  }

  $grpc.ResponseStream<$0.ListenToUserResponse> listenToUser($0.ListenToUserRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$listenToUser, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.JoinChannelResponse> joinChannel($0.JoinChannelRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$joinChannel, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('konfa.voice_relay.v1.VoiceRelayService')
abstract class VoiceRelayServiceBase extends $grpc.Service {
  $core.String get $name => 'konfa.voice_relay.v1.VoiceRelayService';

  VoiceRelayServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SpeakToChannelRequest, $0.SpeakToChannelResponse>(
        'SpeakToChannel',
        speakToChannel,
        true,
        false,
        ($core.List<$core.int> value) => $0.SpeakToChannelRequest.fromBuffer(value),
        ($0.SpeakToChannelResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListenToUserRequest, $0.ListenToUserResponse>(
        'ListenToUser',
        listenToUser_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ListenToUserRequest.fromBuffer(value),
        ($0.ListenToUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.JoinChannelRequest, $0.JoinChannelResponse>(
        'JoinChannel',
        joinChannel_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.JoinChannelRequest.fromBuffer(value),
        ($0.JoinChannelResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ListenToUserResponse> listenToUser_Pre($grpc.ServiceCall call, $async.Future<$0.ListenToUserRequest> request) async* {
    yield* listenToUser(call, await request);
  }

  $async.Stream<$0.JoinChannelResponse> joinChannel_Pre($grpc.ServiceCall call, $async.Future<$0.JoinChannelRequest> request) async* {
    yield* joinChannel(call, await request);
  }

  $async.Future<$0.SpeakToChannelResponse> speakToChannel($grpc.ServiceCall call, $async.Stream<$0.SpeakToChannelRequest> request);
  $async.Stream<$0.ListenToUserResponse> listenToUser($grpc.ServiceCall call, $0.ListenToUserRequest request);
  $async.Stream<$0.JoinChannelResponse> joinChannel($grpc.ServiceCall call, $0.JoinChannelRequest request);
}
