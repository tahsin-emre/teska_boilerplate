import 'dart:convert';

import 'package:teska_boilerplate/product/packages/storage/shared_keys.dart';
import 'package:teska_boilerplate/product/packages/storage/storage_manager.dart';

/// Secure shared preferences manager using FlutterSecureStorage.
///
/// Provides type-safe get/set methods for common data types
/// (String, int, double, bool, List<String>, JSON Map).
final class SharedManager extends StorageManager {
  SharedManager._init();
  static final SharedManager _instance = SharedManager._init();
  static SharedManager get instance => _instance;
  static const _prefix = '__shared_';

  String _key(SharedKeys key) => '$_prefix${key.value}';

  // String
  Future<void> setString(SharedKeys key, String value) async {
    await storage.write(key: _key(key), value: value);
  }

  Future<String?> getString(SharedKeys key) async {
    return storage.read(key: _key(key));
  }

  // int
  Future<void> setInt(SharedKeys key, int value) async {
    await storage.write(key: _key(key), value: value.toString());
  }

  Future<int?> getInt(SharedKeys key) async {
    final value = await storage.read(key: _key(key));
    return value != null ? int.tryParse(value) : null;
  }

  // double
  Future<void> setDouble(SharedKeys key, double value) async {
    await storage.write(key: _key(key), value: value.toString());
  }

  Future<double?> getDouble(SharedKeys key) async {
    final value = await storage.read(key: _key(key));
    return value != null ? double.tryParse(value) : null;
  }

  // bool
  Future<void> setBool(SharedKeys key, {required bool value}) async {
    await storage.write(key: _key(key), value: value.toString());
  }

  Future<bool?> getBool(SharedKeys key) async {
    final value = await storage.read(key: _key(key));
    if (value == null) return null;
    return value == 'true';
  }

  // List<String>
  Future<void> setStringList(SharedKeys key, List<String> value) async {
    await storage.write(key: _key(key), value: jsonEncode(value));
  }

  Future<List<String>?> getStringList(SharedKeys key) async {
    final value = await storage.read(key: _key(key));
    if (value == null) return null;
    final decoded = jsonDecode(value) as List<dynamic>;
    return decoded.cast<String>();
  }

  // JSON Map
  Future<void> setJson(SharedKeys key, Map<String, dynamic> value) async {
    await storage.write(key: _key(key), value: jsonEncode(value));
  }

  Future<Map<String, dynamic>?> getJson(SharedKeys key) async {
    final value = await storage.read(key: _key(key));
    if (value == null) return null;
    return jsonDecode(value) as Map<String, dynamic>;
  }

  // Remove
  Future<void> remove(SharedKeys key) async {
    await storage.delete(key: _key(key));
  }

  // Contains
  Future<bool> containsKey(SharedKeys key) async {
    final value = await storage.read(key: _key(key));
    return value != null;
  }
}
