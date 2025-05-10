import 'package:flutter/foundation.dart';

class ConnectionSettings extends ChangeNotifier {
  String _hubAddress = "";
  int _mainPort = 0;
  int _voicePort = 0;
  bool _isConnected = false;

  String get hubAddress => _hubAddress;
  int get mainPort => _mainPort;
  int get voicePort => _voicePort;
  bool get isConnected => _isConnected;

  void setConnectionInfo(String hubAddress, int mainPort, int voicePort) {
    _hubAddress = hubAddress;
    _mainPort = mainPort;
    _voicePort = voicePort;
    _isConnected = true;
    notifyListeners();
  }

  void reset() {
    _hubAddress = "";
    _mainPort = 0;
    _voicePort = 0;
    _isConnected = false;
    notifyListeners();
  }
}
