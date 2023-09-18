import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lefrigo/models/partial_user.dart';
import 'package:lefrigo/services/get_it.dart';

void main() {
  setUpAll(() async {
    await configureDependencies();

    final apiService = getIt.get<ApiService>();
    apiService.token =
        '574b84387b97612a50de9eaaa24e462c09fa445afbdc181f72536943596c8552';
  });

  test('update user', () async {
    final userService = getIt.get<UserService>();

    final user = await userService.updateUser(
      username: 'user1',
      dob: DateTime.now(),
      country: 'VN',
    );

    expect(user.username, 'user1');
  });
}
