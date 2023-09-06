import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferenceHelper {
  final SharedPreferences _sharedPreference;
  final FlutterSecureStorage _secureStorage;

  SharedPreferenceHelper(this._sharedPreference, this._secureStorage);

  Future<void> saveToken({required authToken}) async {
    await _sharedPreference.setString(PreferenceKeys.authToken, authToken);
  }

  Future<void> saveUser({required email, required password}) async {
    await _sharedPreference.setString(PreferenceKeys.email, email);
    await _secureStorage.write(
      key: PreferenceKeys.password,
      value: password,
    );
  }

  Future<void> removeToken() async {
    await _sharedPreference.remove(PreferenceKeys.authToken);
  }

  Future<void> removeUser() async {
    await _sharedPreference.remove(PreferenceKeys.email);
    await _secureStorage.delete(
      key: PreferenceKeys.password,
    );
  }

  Future<void> clear() async {
    await _sharedPreference.clear();
  }
}

mixin PreferenceKeys {
  static const String email = "email";
  static const String password = "password";
  static const String authToken = "authToken";
}
