import 'package:bloc/bloc.dart';
import 'package:cs426final/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'check_token_event.dart';
part 'check_token_state.dart';

class CheckTokenBloc extends Bloc<CheckTokenEvent, CheckTokenState> {
  final AuthRepository _authRepository;

  CheckTokenBloc(this._authRepository) : super(CheckTokenInitial()) {
    on<CheckTokenAppStarted>(_onCheckTokenAppStarted);
  }

  Future<void> _onCheckTokenAppStarted(
      CheckTokenAppStarted event, Emitter<CheckTokenState> emit) async {
    emit(CheckTokenLoading());
    final token = await _authRepository.getToken();
    if (token != null) {
      final isValid = await _authRepository.isTokenStillValid(token);

      if (isValid) {
        emit(CheckTokenSuccess());
      } else {
        await _authRepository.logout();
        emit(
            CheckTokenFailed(isFirstTime: await _authRepository.isFirstTime()));
      }
    } else {
      emit(CheckTokenFailed(isFirstTime: await _authRepository.isFirstTime()));
    }

    await _authRepository.setFirstTime();
  }
}
