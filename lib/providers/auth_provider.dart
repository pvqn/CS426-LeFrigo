import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lefrigo/services/get_it.dart';

enum AuthProviderStatus {
  unknown,
  loading,
  authenticated,
  authenticatedFailed,
  loggedOut,
}

@immutable
class AuthProviderMessage {
  final AuthProviderStatus status;
  final String? message;

  const AuthProviderMessage({
    required this.status,
    this.message,
  });
}

class AuthProvider extends ChangeNotifier {
  String? _token;

  String get token => _token ?? "";

  final ApiService _apiService;
  final SecureStorageService _secureStorageService;

  AuthProviderMessage _currentStatus = const AuthProviderMessage(
    status: AuthProviderStatus.unknown,
  );

  AuthProviderMessage get currentStatus => _currentStatus;

  AuthProvider()
      : _apiService = getIt<ApiService>(),
        _secureStorageService = getIt<SecureStorageService>();

  void onAppStarted() async {
    final token =
        await _secureStorageService.read(key: SecureStorageKeys.token);

    if (token != null) {
      await _checkTokenStillValid(token: token);

      if (_currentStatus.status == AuthProviderStatus.authenticated) {
        _token = token;
        _apiService.token = _token!;
      } else {
        final email =
            await _secureStorageService.read(key: SecureStorageKeys.email);
        final password =
            await _secureStorageService.read(key: SecureStorageKeys.password);

        if (email != null && password != null) {
          await _loginRequest(email: email, password: password);

          if (_currentStatus.status != AuthProviderStatus.authenticated) {
            await _secureStorageService.delete(key: SecureStorageKeys.email);
            await _secureStorageService.delete(key: SecureStorageKeys.password);
          } else {
            await _secureStorageService.write(
                key: SecureStorageKeys.token, value: _token!);
            _apiService.token = _token!;
          }
        }
      }
    } else {
      _currentStatus = const AuthProviderMessage(
        status: AuthProviderStatus.loggedOut,
      );
    }

    // For testing
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    _currentStatus = const AuthProviderMessage(
      status: AuthProviderStatus.loading,
    );
    notifyListeners();

    await _loginRequest(email: email, password: password);

    if (_currentStatus.status == AuthProviderStatus.authenticated) {
      _secureStorageService.write(key: SecureStorageKeys.token, value: _token!);

      if (rememberMe) {
        _secureStorageService.write(key: SecureStorageKeys.email, value: email);
        _secureStorageService.write(
            key: SecureStorageKeys.password, value: password);
      }

      _apiService.token = _token!;
    }

    notifyListeners();
  }

  Future<void> _loginRequest({
    required String email,
    required String password,
  }) async {
    final loginRes = await _apiService.post(path: '/user/login', body: {
      'email': email,
      'password': password,
    });

    if (loginRes.statusCode != HttpStatus.ok) {
      _currentStatus = const AuthProviderMessage(
        status: AuthProviderStatus.authenticatedFailed,
        message: 'Internet connection error',
      );
    } else {
      Map<String, dynamic> loginResBody = json.decode(loginRes.body);

      if (loginResBody.containsKey('auth_token')) {
        _token = loginResBody['auth_token'];
        _currentStatus = const AuthProviderMessage(
          status: AuthProviderStatus.authenticated,
        );
      } else {
        _currentStatus = const AuthProviderMessage(
          status: AuthProviderStatus.authenticatedFailed,
          message: 'Invalid email or password',
        );
      }
    }
  }

  Future<void> _checkTokenStillValid({required String token}) async {
    _apiService.token = token;
    final checkRes = await _apiService.get(path: '/user/profile');
    _apiService.token = '';

    if (checkRes.statusCode != HttpStatus.ok) {
      _currentStatus = const AuthProviderMessage(
        status: AuthProviderStatus.authenticatedFailed,
        message: 'Internet connection error',
      );
    } else {
      Map<String, dynamic> loginResBody = json.decode(checkRes.body);

      if (loginResBody.containsKey('_id')) {
        _currentStatus = const AuthProviderMessage(
          status: AuthProviderStatus.authenticated,
        );
      } else {
        _currentStatus = const AuthProviderMessage(
          status: AuthProviderStatus.authenticatedFailed,
          message: 'Token expired',
        );
      }
    }
  }
}
