import 'dart:async';

import 'package:cs426final/core/services/api_service.dart';
import 'package:cs426final/core/services/storage_service.dart';

enum AuthenticationStatus { unauthenticated, authenticated, error }

class AuthRepository {
  ApiService _apiService;
  StorageService _storageService;

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  AuthRepository(this._storageService, this._apiService);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final token = await _apiService.login(email: email, password: password);
      await _storageService.saveToken(token);
      _controller.add(AuthenticationStatus.authenticated);
    } catch (e) {
      _controller.add(AuthenticationStatus.error);
    }
  }
}
