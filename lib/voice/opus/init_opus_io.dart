import 'dart:ffi';
import 'dart:io';
import 'package:opus_dart/opus_dart.dart' as opus_dart;
import 'package:opus_flutter/opus_flutter.dart' as opus_flutter;

void setupOpus() {
  if (Platform.isLinux) {
    opus_dart.initOpus(DynamicLibrary.open('libopus.so') as dynamic);
  } else {
    opus_flutter.load();
  }
}
