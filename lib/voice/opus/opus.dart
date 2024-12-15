import 'dart:async';
import 'dart:typed_data';

import 'package:l/l.dart';
import 'package:opus_dart/opus_dart.dart';

export 'init_opus_default.dart' if (dart.library.io) 'init_opus_io.dart';

const sampleSizeMS = 20;

class SimpleStreamOpusEncoder extends StreamTransformerBase<Float32List, Uint8List> {
  final int _maxOutputSizeBytes;
  final int sampleRate;
  final int channels;
  final Application application;

  SimpleStreamOpusEncoder({
    required this.sampleRate,
    required this.channels,
    required this.application,
  }) : _maxOutputSizeBytes = (4 * sampleSizeMS * channels * sampleRate ~/ 1000);

  @override
  Stream<Uint8List> bind(Stream<Float32List> stream) async* {
    final encoder = SimpleOpusEncoder(
      sampleRate: sampleRate,
      channels: channels,
      application: application,
    );

    await for (final event in stream) {
      yield encoder.encodeFloat(
        input: event,
        maxOutputSizeBytes: _maxOutputSizeBytes,
      );
    }

    encoder.destroy();
  }
}

class SimpleStreamOpusDecoder extends StreamTransformerBase<Uint8List?, Float32List> {
  final int sampleRate;
  final int channels;
  final int frameSizeMS;

  SimpleStreamOpusDecoder({
    required this.sampleRate,
    required this.channels,
    this.frameSizeMS = 20,
  });

  @override
  Stream<Float32List> bind(Stream<Uint8List?> stream) async* {
    final decoder = SimpleOpusDecoder(
      sampleRate: sampleRate,
      channels: channels,
    );
    try {
      await for (final event in stream) {
        yield decoder.decodeFloat(
          input: event,
          loss: frameSizeMS,
        );
      }
    } finally {
      decoder.destroy();
    }
  }
}

class StreamEventRateCounter<T> extends StreamTransformerBase<T, T> {
  final String _name;

  StreamEventRateCounter([this._name = ""]);

  @override
  Stream<T> bind(Stream<T> stream) {
    final start = DateTime.now();
    var lastEvent = DateTime.now();
    var lastPrint = DateTime.now();
    var count = 0;

    return stream.map((event) {
      count++;
      lastEvent = DateTime.now();

      if (lastEvent.difference(lastPrint).inSeconds > 1) {
        l.i("$_name event per second: ${count / lastEvent.difference(start).inSeconds}");
        lastPrint = lastEvent;
      }

      return event;
    });
  }
}
