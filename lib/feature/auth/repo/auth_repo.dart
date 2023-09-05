import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This is the authentication repository, where
/// all the action for signUp and logIn is made
class AuthRepo {
  // TODO: Add auth instance

  final Ref _ref; // For accessing other provider (if needed)

  AuthRepo(this._ref);

// TODO: Add function for auth such as
// Future<User> signInWithEmailAndPassword({
//   required String email,
//   required String password,
// }) async {}
}

final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepo(ref));
