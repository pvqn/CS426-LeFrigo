import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lefrigo/models/user.dart';
import 'package:lefrigo/services/get_it.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService;

  UserProvider() : _userService = getIt<UserService>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  User _user = User.empty;

  User get user => _user;

  bool get isUserInfoComplete {
    return _user.country != null && _user.dob != null && _user.username != null;
  }

  Future<void> refreshUser() async {
    _isLoading = true;
    notifyListeners();

    final newUser = await _userService.getCurrentUser();
    _user = newUser;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateUser({
    String? username,
    String? email,
    String? country,
    DateTime? dob,
    XFile? avatar,
  }) async {
    _isLoading = true;
    notifyListeners();

    String? base64Image;

    if (avatar != null) {
      // Convert XFile to String using base64 encoding
      final bytes = await avatar.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    final newUser = await _userService.updateUser(
      username: username,
      email: email,
      country: country,
      dob: dob,
      encodedAvatar: base64Image,
    );
    _user = newUser;

    _isLoading = false;
    notifyListeners();
  }
}
