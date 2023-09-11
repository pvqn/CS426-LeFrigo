// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class StorageService {
  final FlutterSecureStorage _flutterSecureStorage;
  late final Box _encryptedBox;
  late final Box _unencryptedBox;

  late final String _encryptionKeyString;

  StorageService._() : _flutterSecureStorage = const FlutterSecureStorage();

  static StorageService? _instance;

  static Future<StorageService> getInstance() async {
    if (_instance == null) {
      _instance = StorageService._();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    String? encryptionKeyString =
        await _flutterSecureStorage.read(key: 'encryptionKey');

    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      encryptionKeyString = base64UrlEncode(key);
      await _flutterSecureStorage.write(
        key: 'encryptionKey',
        value: encryptionKeyString,
      );
    }

    _encryptionKeyString = encryptionKeyString;

    _encryptedBox = await Hive.openBox(
      'encryptedBox',
      encryptionCipher: HiveAesCipher(base64Url.decode(_encryptionKeyString)),
    );

    _unencryptedBox = await Hive.openBox('unencryptedBox');
  }

  Future<void> saveToken(String token) async {
    await _encryptedBox.put('token', token);
  }

  String? getToken() {
    return _encryptedBox.get('token');
  }
}
