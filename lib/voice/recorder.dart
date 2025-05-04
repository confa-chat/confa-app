import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/voice.pb.dart';
import 'package:konfa/voice/service.dart';

import 'package:konfa/voice/opus/opus.dart';

import 'package:rxdart/rxdart.dart';
import 'package:streaming_sound/streaming_sound.dart';

const sampleSizeMS = 20;

class VoiceChatRecorder {
  final VoiceServiceClient _client;
  final String _serverId;
  final String _channelId;
  final String _userId;

  ResponseFuture<SpeakToChannelResponse>? _request;

  VoiceChatRecorder(this._client, this._serverId, this._channelId, this._userId);

  Future<void> record() async {
    if (_request != null) {
      return;
    }

    _request = _client.speakToChannel(
      recordSoundStream<Float32List>(sampleRate: sampleRate)
          .transform(StreamEventRateCounter("recorder:"))
          // .transform(SimpleStreamOpusEncoder(
          //   sampleRate: sampleRate,
          //   channels: 1,
          //   application: Application.voip,
          // ))
          // .transform(_StreamEventRateCounter("opus:"))
          .map(
            (event) =>
                SpeakToChannelRequest(voiceData: VoiceData(data: event.buffer.asUint8List())),
          )
          .startWith(SpeakToChannelRequest(
            voiceInfo: VoiceInfo(
              codec: AudioCodec.AUDIO_CODEC_PCM_F32,
              serverId: _serverId,
              channelId: _channelId,
              userId: _userId,
            ),
          )),
    );
  }

  Future<void> stop() async {
    _request?.cancel();
  }
}
