import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lefrigo/models/user.dart';
import 'package:lefrigo/services/get_it.dart';

enum UserProviderState {
  updateSuccessed,
  updateFailed,
  fetchComplete,
  fetchFailed,
  loading,
  unknown
}

class UserProviderMessage {
  final UserProviderState state;
  final String? message;

  UserProviderMessage(this.state, [this.message]);
}

class UserProvider extends ChangeNotifier {
  final UserService _userService;

  UserProvider() : _userService = getIt<UserService>();

  User _user = User.empty;

  User get user => _user;

  bool get isUserInfoComplete {
    return _user.country != null && _user.dob != null && _user.username != null;
  }

  UserProviderMessage _status = UserProviderMessage(UserProviderState.unknown);

  UserProviderMessage get status => _status;

  Future<void> refreshUser() async {
    final newUser = await _userService.getCurrentUser();
    _user = newUser;

    _status = UserProviderMessage(UserProviderState.fetchComplete);
    notifyListeners();
  }

  Future<void> updateUser({
    String? username,
    String? email,
    String? country,
    DateTime? dob,
    XFile? avatar,
  }) async {
    String? base64Image;

    if (avatar != null) {
      // Convert XFile to String using base64 encoding
      final bytes = await avatar.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    try {
      final newUser = await _userService.updateUser(
        username: username,
        email: email,
        country: country,
        dob: dob,
        encodedAvatar: base64Image,
      );
      _user = newUser;
      _status = UserProviderMessage(UserProviderState.updateSuccessed);
    } catch (e) {
      _status = UserProviderMessage(
        UserProviderState.updateFailed,
        e.toString(),
      );
    } finally {
      notifyListeners();
    }
  }
}
