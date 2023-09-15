import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lefrigo/models/partial_user.dart';
import 'package:lefrigo/models/user.dart';
import 'package:lefrigo/services/dio_service.dart';

class UserService {
  final DioService _dioService;

  UserService({required DioService dioService}) : _dioService = dioService;

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
      options: Options(
        contentType: 'application/json',
      ),
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
      options: Options(
        contentType: 'application/json',
      ),
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

  Future<Either<DioMessage<String>, DioFailed>> getUserInfo({
    required String id,
  }) async {
    final response = await _dioService.dio.get(
      ApiEndPoints.infoById(id),
    );

    if (response.statusCode != 200) {
      return right(DioFailed('Internet connection error'));
    } else {
      final Map<String, dynamic> userInfoResBody = response.data;

      if (userInfoResBody['success'] == true) {
        return left(DioMessage(userInfoResBody['message']));
      } else {
        return right(DioFailed(userInfoResBody['message']));
      }
    }
  }

  // Using the current token from the DioService
  Future<Either<DioMessage<User>, DioFailed>> getCurrentUser() async {
    final response = await _dioService.dio.get(
      ApiEndPoints.currentUser,
    );

    if (response.statusCode != 200) {
      return right(DioFailed('Internet connection error'));
    } else {
      final Map<String, dynamic> currentUserResBody = response.data;

      if (currentUserResBody.containsKey('_id')) {
        return left(DioMessage(User.fromJson(currentUserResBody)));
      } else {
        return right(DioFailed(currentUserResBody['message']));
      }
    }
  }

  // Update user using the ApiEndPoints.currentUser and incomplete
  // model for PartialUser

  Future<Either<DioMessage<User>, DioFailed>> updateUser({
    String? username,
    String? email,
    String? country,
    DateTime? dob,
    String? encodedAvatar,
  }) async {
    final response = await _dioService.dio.post(
      ApiEndPoints.currentUser,
      data: PartialUser(
        username: username,
        email: email,
        country: country,
        dob: dob,
        avatar: encodedAvatar,
      ).toJson(),
    );

    if (response.statusCode != 200) {
      return right(DioFailed('Internet connection error'));
    } else {
      final Map<String, dynamic> currentUserResBody = response.data;

      if (currentUserResBody['success'] == true) {
        return left(DioMessage(User.fromJson(currentUserResBody)));
      } else {
        return right(DioFailed(currentUserResBody['message']));
      }
    }
  }
}
