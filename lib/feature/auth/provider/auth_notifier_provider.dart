import 'package:cs426final/feature/auth/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_state.dart';

// Since the Authentication covers multiple states
// in the process, we should use a StateNotifierProvider

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepo _repo;

  AuthNotifier(this._repo) : super(AuthInit());

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    state = AuthLoading();

    // TODO: get respond from _repo for logInWithEmailAndPassword
    // final Future<String> respond;

    // respond.then(
    //   (value) => state = AuthSuccess(),
    //   onError: (error) => state = AuthFailed(msg: error),
    // );
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = AuthLoading();

    // TODO: get respond from _repo for signUpWithEmailAndPassword
    // final Future<String> respond;

    // respond.then(
    //   (value) => state = AuthSuccess(),
    //   onError: (error) => state = AuthFailed(msg: error),
    // );
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.read(authRepoProvider)));
