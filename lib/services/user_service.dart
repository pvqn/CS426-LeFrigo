import 'dart:convert';
import 'dart:io';

import 'package:lefrigo/models/partial_user.dart';
import 'package:lefrigo/models/user.dart';
import 'package:lefrigo/services/api_service.dart';

class UserServiceException implements Exception {
  final String message;

  UserServiceException({required this.message});
}

class UserService {
  final ApiService _apiService;

  UserService({required ApiService apiService}) : _apiService = apiService;

  Future<User> getUserById({required String id}) async {
    final response = await _apiService.get(path: '/user/$id');

    if (response.type == ApiResponseType.success) {
      final user = User.fromJson(jsonDecode(response.message ?? '{}'));
      return user;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<User> getCurrentUser() async {
    assert(_apiService.token != '');

    final response = await _apiService.get(path: '/user/profile');

    if (response.type == ApiResponseType.success) {
      try {
        final user = User.fromJson(jsonDecode(response.message!));
        return user;
      } catch (e) {
        throw UserServiceException(message: 'Invalid token');
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<User> updateUser({
    String? username,
    String? email,
    String? country,
    DateTime? dob,
    String? encodedAvatar,
  }) async {
    assert(_apiService.token != '');

    final response = await _apiService.post(
      path: '/user',
      data: PartialUser(
        username: username,
        email: email,
        country: country,
        dob: dob,
        avatar: encodedAvatar,
      ).toJson(),
    );

    if (response.type == ApiResponseType.success) {
      final decode = jsonDecode(response.message!);

      if (decode['success'] == true) {
        final user = User.fromJson(decode['user']);
        return user;
      } else {
        throw UserServiceException(message: decode['message']);
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }
}
