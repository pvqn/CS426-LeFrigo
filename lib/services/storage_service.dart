import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _storage;

  StorageService({required SharedPreferences storage}) : _storage = storage;

  Future<void> writeString({required String key, required String value}) async {
    await _storage.setString(key, value);
  }

  String? readString({required String key}) {
    return _storage.getString(key);
  }

  Future<void> writeBool({required String key, required bool value}) async {
    await _storage.setBool(key, value);
  }

  bool? readBool({required String key}) {
    return _storage.getBool(key);
  }

  Future<void> delete({required String key}) async {
    await _storage.remove(key);
  }

  Future<void> deleteAll() async {
    await _storage.clear();
  }
}
