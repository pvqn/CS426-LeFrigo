import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    // Handle events and emit states here
  }
}
