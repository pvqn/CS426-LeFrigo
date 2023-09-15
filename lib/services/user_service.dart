import 'package:fpdart/fpdart.dart';
import 'package:lefrigo/models/partial_user.dart';
import 'package:lefrigo/models/user.dart';
import 'package:lefrigo/services/dio_service.dart';

class UserService {
  final DioService _dioService;

  UserService({required DioService dioService}) : _dioService = dioService;

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
