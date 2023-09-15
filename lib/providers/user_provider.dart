/// Precautions:
/// Only use this Provider when the authentication is complete

import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lefrigo/models/user.dart';
import 'package:lefrigo/services/get_it.dart';

enum UserStatus {
  initial,
  loading,
  complete,
  incomplete,
  updateComplete,
  updateFailed,
}

class UserProvider extends ChangeNotifier {
  UserService _service;

  UserProvider() : _service = getIt<UserService>();

  UserStatus _status = UserStatus.initial;
  UserStatus get status => _status;

  Future<Either<User, String>> getUser() async {
    _status = UserStatus.loading;
    notifyListeners();

    final result = await _service.getCurrentUser();

    return result.fold(
      (user) {
        _status = UserStatus.complete;
        notifyListeners();
        return left(user.data);
      },
      (error) {
        _status = UserStatus.incomplete;
        notifyListeners();
        return right(error.message);
      },
    );
  }

  Future<Either<User, String>> updateUser({
    String? username,
    String? email,
    String? country,
    DateTime? dob,
    XFile? avatar,
  }) async {
    _status = UserStatus.loading;
    notifyListeners();

    String? base64Image;

    if (avatar != null) {
      // Convert XFile to String using base64 encoding
      final bytes = await avatar.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    final result = await _service.updateUser(
      username: username,
      email: email,
      country: country,
      dob: dob,
      encodedAvatar: base64Image,
    );

    return result.fold(
      (user) {
        _status = UserStatus.updateComplete;
        notifyListeners();
        return left(user.data);
      },
      (error) {
        _status = UserStatus.updateFailed;
        notifyListeners();
        return right(error.message);
      },
    );
  }
}
