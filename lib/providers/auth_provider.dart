import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:lefrigo/services/get_it.dart';

enum AuthProviderStatus {
  unknown,
  loading,
  authenticated,
  authenticatedFailed,
  loggedOut,
  signupSuccess,
  signupFailed,
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
  final DioService _dioService;
  final UserService _userService;
  final AuthService _authService;
  final CredentialService _credentialService;

  AuthProviderMessage _currentStatus = const AuthProviderMessage(
    status: AuthProviderStatus.unknown,
  );

  AuthProviderMessage get currentStatus => _currentStatus;

  AuthProvider()
      : _dioService = getIt<DioService>(),
        _userService = getIt<UserService>(),
        _authService = getIt<AuthService>(),
        _credentialService = getIt<CredentialService>();

  void onAppStarted() async {
    final token = await _credentialService.getToken();

    _dioService.setToken(token ?? "");

    final user = await _userService.getCurrentUser();

    user.fold(
      (success) => _currentStatus = const AuthProviderMessage(
        status: AuthProviderStatus.authenticated,
      ),
      (failed) async {
        _currentStatus = const AuthProviderMessage(
          status: AuthProviderStatus.loggedOut,
        );
        _dioService.setToken("");
        await _credentialService.deleteToken();
      },
    );

    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    _currentStatus = const AuthProviderMessage(
      status: AuthProviderStatus.loading,
    );
    notifyListeners();

    final loginRes = await _authService.login(
      email: email,
      password: password,
    );

    loginRes.fold(
      (success) async {
        _dioService.setToken(success.data);
        await _credentialService.setToken(token: success.data);
        _currentStatus = const AuthProviderMessage(
          status: AuthProviderStatus.signupSuccess,
        );
      },
      (failed) {
        _currentStatus = AuthProviderMessage(
          status: AuthProviderStatus.signupFailed,
          message: failed.message,
        );
      },
    );

    notifyListeners();
  }

  Future<void> logout() async {
    _currentStatus = const AuthProviderMessage(
      status: AuthProviderStatus.loading,
    );
    notifyListeners();

    // final logoutRes = await _userService.logout();

    // Whether the logout is success or not,
    // we always remove the token from the storage.
    // This means that the user will always be logged out successfully.

    await _credentialService.deleteToken();
    _currentStatus = const AuthProviderMessage(
      status: AuthProviderStatus.loggedOut,
    );

    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    _currentStatus = const AuthProviderMessage(
      status: AuthProviderStatus.loading,
    );
    notifyListeners();

    final registerRes = await _authService.register(
      email: email,
      password: password,
    );

    registerRes.fold(
      (success) async {
        _currentStatus = AuthProviderMessage(
          status: AuthProviderStatus.loggedOut,
          message: success.data,
        );
      },
      (failed) {
        _currentStatus = AuthProviderMessage(
          status: AuthProviderStatus.loggedOut,
          message: failed.message,
        );
      },
    );

    notifyListeners();
  }
}
