part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class ButtonPressedEvent extends SignUpEvent {
  // You can add properties and constructors for the event
}
