import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class _SecureStorageKeys {
  _SecureStorageKeys._();

  static const token = 'token';
  static const email = 'email';
  static const password = 'password';
}

class CredentialService {
  final FlutterSecureStorage _storage;

  // The email and password are not stored in the secure storage
  // but some task (reseting password) requires relogin
  // so we need to store them in memory
  final Map<String, dynamic> _credentials = {};

  CredentialService({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<void> setToken({required String token}) {
    _credentials[_SecureStorageKeys.token] = token;
    return _storage.write(key: _SecureStorageKeys.token, value: token);
  }

  Future<String?> getToken() {
    if (_credentials.containsKey(_SecureStorageKeys.token)) {
      return Future.value(_credentials[_SecureStorageKeys.token]);
    }
    return _storage
        .read(key: _SecureStorageKeys.token)
        .then((value) => _credentials[_SecureStorageKeys.token] = value);
  }

  Future<void> deleteToken() {
    return _storage.delete(key: _SecureStorageKeys.token);
  }

  void saveEmailAndPassWord({
    String? email,
    String? password,
  }) {
    _credentials[_SecureStorageKeys.email] =
        email ?? _credentials[_SecureStorageKeys.email];
    _credentials[_SecureStorageKeys.password] =
        password ?? _credentials[_SecureStorageKeys.password];
  }

  String? getEmail() => _credentials[_SecureStorageKeys.email];

  String? getPassword() => _credentials[_SecureStorageKeys.password];
}
