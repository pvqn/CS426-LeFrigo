// import 'package:fpdart/fpdart.dart';
// import 'package:lefrigo/services/dio_service.dart';

// class AuthService {
//   final DioService _dioService;

//   AuthService({required DioService dioService}) : _dioService = dioService;

//   Future<Either<DioMessage<String>, DioFailed>> login({
//     required String email,
//     required String password,
//   }) async {
//     final response = await _dioService.dio.post(
//       ApiEndPoints.login,
//       data: {
//         'email': email,
//         'password': password,
//       },
//     );

//     if (response.statusCode != 200) {
//       return right(DioFailed('Internet connection error'));
//     } else {
//       final Map<String, dynamic> loginResBody = response.data;

//       if (loginResBody.containsKey('auth_token')) {
//         return left(DioMessage(loginResBody['auth_token']));
//       } else {
//         return right(DioFailed('Invalid email or password'));
//       }
//     }
//   }

//   Future<Either<DioMessage<String>, DioFailed>> register({
//     required String email,
//     required String password,
//   }) async {
//     final response = await _dioService.dio.post(
//       ApiEndPoints.register,
//       data: {
//         'email': email,
//         'password': password,
//       },
//     );

//     if (response.statusCode != 200) {
//       return right(DioFailed('Internet connection error'));
//     } else {
//       final Map<String, dynamic> registerResBody = response.data;

//       if (registerResBody['success'] == true) {
//         return left(DioMessage(registerResBody['message']));
//       } else {
//         return right(DioFailed(registerResBody['message']));
//       }
//     }
//   }

//   Future<Either<DioMessage<String>, DioFailed>> updatePassword({
//     required String oldPassword,
//     required String newPassword,
//   }) async {
//     final response = await _dioService.dio.post(
//       ApiEndPoints.updatePassword,
//       data: {
//         'old_password': oldPassword,
//         'new_password': newPassword,
//       },
//     );

//     if (response.statusCode != 200) {
//       return right(DioFailed('Internet connection error'));
//     } else {
//       final Map<String, dynamic> updatePasswordResBody = response.data;

//       if (updatePasswordResBody['success'] == true) {
//         return left(DioMessage(updatePasswordResBody['message']));
//       } else {
//         return right(DioFailed(updatePasswordResBody['message']));
//       }
//     }
//   }

//   Future<Either<DioMessage<String>, DioFailed>> logout() async {
//     final token = _dioService.getToken();
//     assert(token != null);

//     final response = await _dioService.dio.post(
//       ApiEndPoints.logout,
//       data: {
//         'auth_token': token,
//       },
//     );

//     if (response.statusCode != 200) {
//       return right(DioFailed('Internet connection error'));
//     } else {
//       final Map<String, dynamic> logoutResBody = response.data;

//       if (logoutResBody['success'] == true) {
//         return left(DioMessage(logoutResBody['message']));
//       } else {
//         return right(DioFailed(logoutResBody['message']));
//       }
//     }
//   }

//   Future<void> forgotPassword({required String email}) async {
//     // The email can only receive the reset password link if the email is registered
//     // So we can ignore the response
//     await _dioService.dio.post(
//       ApiEndPoints.forgotPassword,
//       data: {
//         'email': email,
//       },
//     );
//   }

//   Future<Either<DioMessage<String>, DioFailed>> resetPassword({
//     required String email,
//     required String code,
//     required String password,
//   }) async {
//     final response = await _dioService.dio.post(
//       ApiEndPoints.resetPassword,
//       data: {
//         'email': email,
//         'code': code,
//         'password': password,
//       },
//     );

//     if (response.statusCode != 200) {
//       return right(DioFailed('Internet connection error'));
//     } else {
//       final Map<String, dynamic> resetPasswordResBody = response.data;

//       if (resetPasswordResBody['success'] == true) {
//         return left(DioMessage(resetPasswordResBody['message']));
//       } else {
//         return right(DioFailed(resetPasswordResBody['message']));
//       }
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:lefrigo/services/api_service.dart';

class AuthServiceException implements Exception {
  final String message;

  AuthServiceException(this.message);
}

class AuthService {
  ApiService _apiService;

  AuthService({required ApiService apiService}) : _apiService = apiService;

  String get token => _apiService.token;

  set token(String token) {
    _apiService.token = token;
  }

  Future<String> login(
      {required String email, required String password}) async {
    final response = await _apiService.post(
      path: '/user/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.type == ApiResponseType.success) {
      final Map<String, dynamic> loginResBody =
          jsonDecode(response.message ?? '{}');

      if (loginResBody.containsKey('auth_token')) {
        return loginResBody['auth_token'];
      } else {
        throw AuthServiceException('Invalid email or password');
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    final response = await _apiService.post(
      path: '/user/register',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.type == ApiResponseType.success) {
      final Map<String, dynamic> registerResBody =
          jsonDecode(response.message ?? '{}');

      if (registerResBody['success'] == false) {
        throw AuthServiceException(registerResBody['message']);
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<void> logout() async {
    assert(_apiService.token != '');

    final response = await _apiService.post(
      path: '/user/logout',
      data: {
        'auth_token': _apiService.token,
      },
    );

    if (response.type == ApiResponseType.success) {
      final Map<String, dynamic> logoutResBody =
          jsonDecode(response.message ?? '{}');

      if (logoutResBody['success'] == false) {
        throw AuthServiceException(logoutResBody['message']);
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  // Future<void> changePassword(
  //     {required String oldPassword, required String newPassword}) async {
  //   final response = await _apiService.post(
  //     path: '/user/changepassword',
  //     data: {
  //       'old_password': oldPassword,
  //       'new_password': newPassword,
  //     },
  //   );

  //   if (response.type == ApiResponseType.success) {
  //     final Map<String, dynamic> changePasswordResBody =
  //         jsonDecode(response.message ?? '{}');

  //     if (changePasswordResBody['success'] == false) {
  //       throw AuthServiceException(changePasswordResBody['message']);
  //     }
  //   } else {
  //     throw AuthServiceException('Internet connection error');
  //   }
  // }

  Future<void> forgotPassword({required String email}) async {
    final response = await _apiService.post(
      path: '/user/forgotpassword',
      data: {
        'email': email,
      },
    );

    if (response.type == ApiResponseType.success) {
      final Map<String, dynamic> forgotPasswordResBody =
          jsonDecode(response.message ?? '{}');

      if (forgotPasswordResBody['success'] == false) {
        throw AuthServiceException(forgotPasswordResBody['message']);
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    final response = await _apiService.post(
      path: '/user/resetpassword',
      data: {
        'email': email,
        'code': code,
        'password': password,
      },
    );

    if (response.type == ApiResponseType.success) {
      final Map<String, dynamic> resetPasswordResBody =
          jsonDecode(response.message ?? '{}');

      if (resetPasswordResBody['success'] == false) {
        throw AuthServiceException(resetPasswordResBody['message']);
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }
}
