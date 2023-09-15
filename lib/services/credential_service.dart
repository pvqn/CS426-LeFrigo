import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class _SecureStorageKeys {
  _SecureStorageKeys._();

  static const String token = 'token';
}

class CredentialService {
  final FlutterSecureStorage _storage;

  CredentialService({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<void> setToken({required String token}) {
    return _storage.write(key: _SecureStorageKeys.token, value: token);
  }

  Future<String?> getToken() {
    return _storage.read(key: _SecureStorageKeys.token);
  }

  Future<void> deleteToken() {
    return _storage.delete(key: _SecureStorageKeys.token);
  }
}
