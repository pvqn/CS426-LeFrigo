import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lefrigo/models/partial_user.dart';
import 'package:lefrigo/services/get_it.dart';

void main() {
  setUpAll(() async => await configureDependencies());

  test('user with token success', () async {
    final userService = getIt<UserService>();

    final user = await userService.getCurrentUser();

    expect(user, isNotEmpty);
  });

  test('parsing the user profile upload', () {
    String username = 'test';
    String country = 'test';
    DateTime dob = DateTime.now();

    File image = File('assets/images/google.png');

    final user = PartialUser(
      username: username,
      country: country,
      dob: dob,
      avatar: base64Encode(image.readAsBytesSync()),
    ).toJson();

    print('user: $user');

    expect(user, isNotEmpty);
  });

  test('convert request to image', () async {
    // Get ApiService
    final apiService = getIt<ApiService>();

    final pathFromId = '/asset/64f7082a417d19c0b3b39aa0';

    // final response = await apiService.get(path: pathFromId);

    // print(response.message!.length);

    // final path = Uri.http('52.192.217.234:8888', pathFromId);

    // final response2 = await http.get(path);

    // print(response2.bodyBytes.runtimeType);
  });
}
