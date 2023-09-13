import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial());

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    // Handle events and emit states here
  }
}
