import 'package:teska_boilerplate/product/packages/storage/storage_manager.dart';

final class TokenStorageManager extends StorageManager {
  static const _keyToken = '__secure_t';

  Future<void> saveToken(String token) async {
    await storage.write(key: _keyToken, value: token);
  }

  Future<String?> getToken() async {
    return storage.read(key: _keyToken);
  }

  Future<void> clearToken() async {
    await storage.delete(key: _keyToken);
  }

  Future<void> clearAll() async {
    await storage.deleteAll();
  }
}
