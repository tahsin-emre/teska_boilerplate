import 'dart:convert';

import 'package:teska_boilerplate/product/packages/storage/storage_manager.dart';

/// Secure shared preferences manager using FlutterSecureStorage.
///
/// Provides type-safe get/set methods for common data types
/// (String, int, double, bool, List<String>, JSON Map).
final class SharedManager extends StorageManager {
  static const _prefix = '__shared_';

  String _key(String key) => '$_prefix$key';

  // String
  Future<void> setString(String key, String value) async {
    await storage.write(key: _key(key), value: value);
  }

  Future<String?> getString(String key) async {
    return storage.read(key: _key(key));
  }

  // int
  Future<void> setInt(String key, int value) async {
    await storage.write(key: _key(key), value: value.toString());
  }

  Future<int?> getInt(String key) async {
    final value = await storage.read(key: _key(key));
    return value != null ? int.tryParse(value) : null;
  }

  // double
  Future<void> setDouble(String key, double value) async {
    await storage.write(key: _key(key), value: value.toString());
  }

  Future<double?> getDouble(String key) async {
    final value = await storage.read(key: _key(key));
    return value != null ? double.tryParse(value) : null;
  }

  // bool
  Future<void> setBool(String key, {required bool value}) async {
    await storage.write(key: _key(key), value: value.toString());
  }

  Future<bool?> getBool(String key) async {
    final value = await storage.read(key: _key(key));
    if (value == null) return null;
    return value == 'true';
  }

  // List<String>
  Future<void> setStringList(String key, List<String> value) async {
    await storage.write(key: _key(key), value: jsonEncode(value));
  }

  Future<List<String>?> getStringList(String key) async {
    final value = await storage.read(key: _key(key));
    if (value == null) return null;
    final decoded = jsonDecode(value) as List<dynamic>;
    return decoded.cast<String>();
  }

  // JSON Map
  Future<void> setJson(String key, Map<String, dynamic> value) async {
    await storage.write(key: _key(key), value: jsonEncode(value));
  }

  Future<Map<String, dynamic>?> getJson(String key) async {
    final value = await storage.read(key: _key(key));
    if (value == null) return null;
    return jsonDecode(value) as Map<String, dynamic>;
  }

  // Remove
  Future<void> remove(String key) async {
    await storage.delete(key: _key(key));
  }

  // Contains
  Future<bool> containsKey(String key) async {
    final value = await storage.read(key: _key(key));
    return value != null;
  }
}
