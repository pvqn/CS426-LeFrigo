part of 'auth_notifier_provider.dart';

sealed class AuthState extends Equatable {}

final class AuthInit extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthSuccess extends AuthState {
  // TODO: add User here

  @override
  List<Object?> get props => [];
}

final class AuthFailed extends AuthState {
  final String msg;

  AuthFailed({required this.msg});

  @override
  List<Object?> get props => [msg];
}
