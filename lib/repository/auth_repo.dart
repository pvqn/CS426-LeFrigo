import 'package:cs426final/data/local/storage_keys.dart';
import 'package:cs426final/data/local/token_service.dart';
import 'package:cs426final/data/remote/api_auth_service.dart';

class AuthRepository {
  final ApiAuthService _authService;
  final StorageService _storageService;

  AuthRepository(this._authService, this._storageService);

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final token = await _authService.login(email: email, password: password);
    return token;
  }

  Future<bool> isTokenStillValid(String token) async {
    try {
      await _authService.getCurrentUser(token);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    await _storageService.setString(StorageKeys.token, token);
  }

  Future<String?> getToken() async {
    return await _storageService.getString(StorageKeys.token);
  }

  Future<void> logout() async {
    await _storageService.deleteString(StorageKeys.token);
    await _storageService.deleteString(StorageKeys.firstTimeKey);
  }

  Future<bool> isFirstTime() async {
    final firstTime = await _storageService.getString(StorageKeys.firstTimeKey);
    return firstTime == null;
  }

  Future<void> setFirstTime() async {
    await _storageService.setString(StorageKeys.firstTimeKey, 'false');
  }
}
