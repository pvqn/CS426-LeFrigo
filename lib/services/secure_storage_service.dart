import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageKeys {
  SecureStorageKeys._();

  static const String token = 'token';
  static const String email = 'email';
  static const String password = 'password';
}

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
