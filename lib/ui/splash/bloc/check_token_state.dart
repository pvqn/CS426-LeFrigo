part of 'check_token_bloc.dart';

sealed class CheckTokenState extends Equatable {
  const CheckTokenState();

  @override
  List<Object> get props => [];
}

final class CheckTokenInitial extends CheckTokenState {}

final class CheckTokenLoading extends CheckTokenState {}

final class CheckTokenSuccess extends CheckTokenState {}

final class CheckTokenFailed extends CheckTokenState {
  final bool isFirstTime;

  const CheckTokenFailed({required this.isFirstTime});
}
