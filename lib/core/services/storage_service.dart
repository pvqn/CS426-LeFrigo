import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _flutterSecureStorage;

  StorageService._() : _flutterSecureStorage = const FlutterSecureStorage();

  static final StorageService _instance = StorageService._();

  factory StorageService() => _instance;

  Future<void> saveToken(String token) async {
    await _flutterSecureStorage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _flutterSecureStorage.read(key: 'token');
  }
}
