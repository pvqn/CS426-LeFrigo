import 'package:fpdart/fpdart.dart';
import 'package:lefrigo/services/dio_service.dart';

class AuthService {
  final DioService _dioService;

  AuthService({required DioService dioService}) : _dioService = dioService;

  Future<Either<DioMessage<String>, DioFailed>> login({
    required String email,
    required String password,
  }) async {
    final response = await _dioService.dio.post(
      ApiEndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      return right(DioFailed('Internet connection error'));
    } else {
      final Map<String, dynamic> loginResBody = response.data;

      if (loginResBody.containsKey('auth_token')) {
        return left(DioMessage(loginResBody['auth_token']));
      } else {
        return right(DioFailed('Invalid email or password'));
      }
    }
  }

  Future<Either<DioMessage<String>, DioFailed>> register({
    required String email,
    required String password,
  }) async {
    final response = await _dioService.dio.post(
      ApiEndPoints.register,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      return right(DioFailed('Internet connection error'));
    } else {
      final Map<String, dynamic> registerResBody = response.data;

      if (registerResBody['success'] == true) {
        return left(DioMessage(registerResBody['message']));
      } else {
        return right(DioFailed(registerResBody['message']));
      }
    }
  }

  Future<Either<DioMessage<String>, DioFailed>> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await _dioService.dio.post(
      ApiEndPoints.updatePassword,
      data: {
        'old_password': oldPassword,
        'new_password': newPassword,
      },
    );

    if (response.statusCode != 200) {
      return right(DioFailed('Internet connection error'));
    } else {
      final Map<String, dynamic> updatePasswordResBody = response.data;

      if (updatePasswordResBody['success'] == true) {
        return left(DioMessage(updatePasswordResBody['message']));
      } else {
        return right(DioFailed(updatePasswordResBody['message']));
      }
    }
  }
}
