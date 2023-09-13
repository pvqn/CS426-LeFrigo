part of 'check_token_bloc.dart';

sealed class CheckTokenEvent extends Equatable {
  const CheckTokenEvent();

  @override
  List<Object> get props => [];
}

final class CheckTokenAppStarted extends CheckTokenEvent {}
