import 'dart:async';

import 'package:cs426final/core/repositories/services/api_service.dart';
import 'package:cs426final/core/repositories/services/storage_service.dart';

enum AuthenticationStatus { unauthenticated, authenticated, error }

class AuthenticationMessage {
  final AuthenticationStatus status;
  final String? message;

  AuthenticationMessage(this.status, {this.message});
}

class AuthRepository {
  ApiService _apiService;
  StorageService _storageService;

  final _controller = StreamController<AuthenticationMessage>();

  Stream<AuthenticationMessage> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationMessage(AuthenticationStatus.unauthenticated);
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
      _controller
          .add(AuthenticationMessage(AuthenticationStatus.authenticated));
    } catch (e) {
      _controller.add(AuthenticationMessage(AuthenticationStatus.error,
          message: e.toString()));
    }
  }
}
