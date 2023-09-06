import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum IsInfoComplete {
  complete,
  incomplete,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.loggedIn({
    required String token,
    required IsInfoComplete complete,
  }) = _LoggedIn;

  const factory AuthState.loggedOut() = _LoggedOut;

  const factory AuthState.failed(String message) = _Failed;
}
