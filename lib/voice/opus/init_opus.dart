import 'dart:ffi';
import 'dart:io';
import 'package:opus_dart/opus_dart.dart' as opus_dart;
import 'package:opus_flutter_ios/opus_flutter_ios.dart' as opus_flutter_ios;
import 'package:opus_flutter_android/opus_flutter_android.dart' as opus_flutter_android;

Future<void> initOpus() async {
  opus_dart.initOpus(await loadOpus());
}

Future<dynamic> loadOpus() async {
  if (Platform.isLinux) {
    return DynamicLibrary.open('data/flutter_assets/opus/linux/libopus.so');
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('data/flutter_assets/opus/windows/libopus_x64.dll');
  } else if (Platform.isAndroid) {
    return await opus_flutter_android.OpusFlutterAndroid().load();
  } else if (Platform.isIOS) {
    return await opus_flutter_ios.OpusFlutterIOS().load();
  }
}
