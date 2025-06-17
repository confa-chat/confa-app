import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  static late final SharedStorage _storage;

  final SharedPreferencesWithCache prefs;

  static Future<void> init() async {
    final sharedPreferences = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(),
    );
    _storage = SharedStorage._(sharedPreferences);
  }

  SharedStorage._(this.prefs);

  static SharedStorage get instance {
    return _storage;
  }

  Future<void> _saveString(String key, String value) async {
    await prefs.setString(key, value);
  }

  String? _getString(String key) {
    return prefs.getString(key);
  }

  static const lastRouteKey = 'last_route';

  Future<void> saveLastRoute(String value) async {
    await _saveString(lastRouteKey, value);
  }

  String? getLastRoute() {
    return _getString(lastRouteKey);
  }
}
