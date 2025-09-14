import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:l/l.dart';

part 'shared_storage.g.dart';

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

  factory SharedStorage() => instance;

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

  Future<void> saveLastRoute(SavedRoute route) async {
    await _saveString(lastRouteKey, jsonEncode(route.toJson()));
  }

  SavedRoute? getLastRoute() {
    try {
      final lastRouteJson = jsonDecode(_getString(lastRouteKey) ?? '{}');
      return SavedRoute.fromJson(lastRouteJson);
    } catch (e) {
      l.w('Failed to decode saved route: $e');
      return null;
    }
  }
}

@JsonSerializable()
class SavedRoute {
  final Uri hubID;
  final String? serverID;

  SavedRoute({required this.hubID, this.serverID});

  /// Connect the generated [_$SavedRouteFromJson] function to the `fromJson`
  /// factory.
  factory SavedRoute.fromJson(Map<String, dynamic> json) => _$SavedRouteFromJson(json);

  /// Connect the generated [_$SavedRouteToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SavedRouteToJson(this);
}
