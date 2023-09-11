import 'package:bloc/bloc.dart';
import 'package:cs426final/core/repositories/models/user_full.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(status: AppStatus.unauthenticated));
}
