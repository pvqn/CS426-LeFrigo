part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

final class AppState extends Equatable {
  const AppState({
    required this.status,
    this.user = UserFull.guest,
  });

  final AppStatus status;
  final UserFull user;

  @override
  List<Object> get props => [status, user];
}
