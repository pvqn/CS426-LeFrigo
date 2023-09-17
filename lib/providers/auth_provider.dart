import 'package:flutter/foundation.dart';
import 'package:lefrigo/services/get_it.dart';

enum AuthNotifierStatus {
  authenticated,
  inauthenticated,
  logInSucess,
  logInFailed,
  updatePasswordFailed,
  sendPasswordResetEmailSuccess,
  sendPasswordResetEmailFailed,
  logOut,
  unknown,
}

@immutable
class AuthNotifierMessage {
  final AuthNotifierStatus status;
  final String? message;

  const AuthNotifierMessage({
    required this.status,
    this.message,
  });
}

class AuthProvider extends ChangeNotifier {
  final CredentialService _credentialService;
  final AuthService _authService;
  final UserService _userService;

  AuthProvider()
      : _authService = getIt<AuthService>(),
        _credentialService = getIt<CredentialService>(),
        _userService = getIt<UserService>(),
        _currentStatus = const AuthNotifierMessage(
          status: AuthNotifierStatus.unknown,
        );

  AuthNotifierMessage _currentStatus;

  AuthNotifierMessage get currentStatus => _currentStatus;

  Future<void> onAppStarted() async {
    final token = await _credentialService.getToken();

    if (token != null) {
      _authService.token = token;
      try {
        await _userService.getCurrentUser();
      } catch (e) {
        _authService.token = '';
        await _credentialService.deleteToken();
      }
    }

    await Future.delayed(const Duration(seconds: 2));

    _currentStatus = _authService.token.isEmpty
        ? const AuthNotifierMessage(
            status: AuthNotifierStatus.inauthenticated,
          )
        : const AuthNotifierMessage(
            status: AuthNotifierStatus.authenticated,
          );
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final token = await _authService.login(
        email: email,
        password: password,
      );

      _authService.token = token;
      await _credentialService.setToken(token: token);

      _currentStatus = const AuthNotifierMessage(
        status: AuthNotifierStatus.logInSucess,
      );
    } catch (e) {
      _currentStatus = AuthNotifierMessage(
        status: AuthNotifierStatus.logInFailed,
        message: e.toString(),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      _currentStatus = AuthNotifierMessage(
        status: AuthNotifierStatus.authenticated,
        message: e.toString(),
      );
    }

    _authService.token = '';
    await _credentialService.deleteToken();
    _currentStatus = const AuthNotifierMessage(
      status: AuthNotifierStatus.inauthenticated,
    );
    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await _authService.register(
        email: email,
        password: password,
      );
    } catch (e) {
      _currentStatus = AuthNotifierMessage(
        status: AuthNotifierStatus.inauthenticated,
        message: e.toString(),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _authService.forgotPassword(
        email: email,
      );
      _currentStatus = const AuthNotifierMessage(
        status: AuthNotifierStatus.sendPasswordResetEmailSuccess,
      );
    } catch (e) {
      _currentStatus = AuthNotifierMessage(
        status: AuthNotifierStatus.sendPasswordResetEmailFailed,
        message: e.toString(),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<void> updatePassword(String oldPassword, String newPassword) async {
    try {
      _authService.changePassword(
          oldPassword: oldPassword, newPassword: newPassword);
      _currentStatus = const AuthNotifierMessage(
        status: AuthNotifierStatus.logOut,
      );
    } catch (e) {
      _currentStatus = AuthNotifierMessage(
        status: AuthNotifierStatus.updatePasswordFailed,
        message: e.toString(),
      );
    } finally {
      notifyListeners();
    }
  }
}
