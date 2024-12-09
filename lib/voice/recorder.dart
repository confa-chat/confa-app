import 'dart:async';

import 'package:konfa/gen/proto/konfa/voice/v1/service.pbgrpc.dart';
import 'package:konfa/gen/proto/konfa/voice/v1/voice.pb.dart';
import 'package:konfa/voice/connection.dart';

import 'package:opus_dart/opus_dart.dart';
import 'package:konfa/voice/opus/opus.dart';

import 'package:rxdart/rxdart.dart';
import 'package:streaming_sound/streaming_sound.dart';

const sampleSizeMS = 20;

class VoiceChatRecorder {
  final VoiceServiceClient _client;
  final String _serverId;
  final String _channelId;
  final String _userId;

  VoiceChatRecorder(this._client, this._serverId, this._channelId, this._userId);

  Future<void> record() async {
    await _client.send(
      recordSoundStream(sampleRate: sampleRate)
          .transform(StreamEventRateCounter("recorder:"))
          // .transform(SimpleStreamOpusEncoder(
          //   sampleRate: sampleRate,
          //   channels: 1,
          //   application: Application.voip,
          // ))
          // .transform(_StreamEventRateCounter("opus:"))
          .map(
            (event) => SendRequest(voiceData: VoiceData(data: event.buffer.asUint8List())),
          )
          .startWith(SendRequest(
            voiceInfo: VoiceInfo(
              codec: Codec.CODEC_PCM_F32,
              serverId: _serverId,
              channelId: _channelId,
              userId: _userId,
            ),
          )),
    );
  }
}
