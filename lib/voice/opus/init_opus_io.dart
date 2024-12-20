import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:opus_dart/opus_dart.dart' as opus_dart;
import 'package:opus_flutter/opus_flutter.dart' as opus_flutter;

Future<void> setupOpus() async {
  if (Platform.isLinux) {
    opus_dart.initOpus(DynamicLibrary.open('libopus.so') as dynamic);
  } else if (Platform.isWindows) {
    final dllPath = await _copyWindowsFiles();
    opus_dart.initOpus(DynamicLibrary.open(dllPath) as dynamic);
  } else {
    await opus_flutter.load();
  }
}

Future<String> _copyWindowsFiles() async {
  Directory dir = Directory('./lib/opus').absolute;
  await dir.create(recursive: true);

  ByteData data;

  String src;
  String dst;
  if (Platform.version.contains('x64')) {
    src = 'libopus_x64.dll.blob';
    dst = 'libopus_x64.dll';
  } else {
    src = 'libopus_x86.dll.blob';
    dst = 'libopus_x86.dll';
  }

  final f = File('${dir.path}/$dst');
  if (!(await f.exists())) {
    data = await rootBundle.load('packages/opus_flutter_windows/assets/$src');
    await f.writeAsBytes(data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  return f.path;
}
