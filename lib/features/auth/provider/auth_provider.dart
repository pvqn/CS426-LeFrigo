import 'package:cs426final/config/shared_model/user.dart';
import 'package:cs426final/features/auth/repo/auth_repo.dart';
import 'package:cs426final/features/auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepo _repo;

  AuthNotifier(this._repo) : super(const AuthState.initial());

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    state = await _repo.login(email, password);
  }

  Future<void> signup(String email, String password) async {
    state = const AuthState.loading();
    state = await _repo.signup(email, password);
  }

  Future<void> updateInfo(User newInfo, String token) async {
    state = const AuthState.loading();
    state = await _repo.completeUserInfo(newInfo, token);
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.read(authRepoProvider)));
