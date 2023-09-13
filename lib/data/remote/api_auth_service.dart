import 'dart:convert';
import 'dart:io';

import 'package:cs426final/data/model/user.dart';
import 'package:cs426final/data/remote/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ApiAuthServiceException implements Exception {
  String message;
  ApiAuthServiceException(this.message);
}

class ApiAuthService {
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.http(ApiEndpoints.baseUrl, '/user/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode != HttpStatus.accepted) {
      throw ApiAuthServiceException('Connection failed');
    }

    final body = jsonDecode(response.body);

    if (body['success'] != true) {
      throw ApiAuthServiceException('Credential invalid');
    }

    return body['auth_token'];
  }

  Future<User> getCurrentUser(String token) async {
    final response = await http.get(
      Uri.http(ApiEndpoints.baseUrl, '/user/profile'),
      headers: {'Authorization': token},
    );

    if (response.statusCode != HttpStatus.accepted) {
      throw ApiAuthServiceException('Connection failed');
    }

    final body = jsonDecode(response.body);

    if (!body.containsKey('_id')) {
      throw ApiAuthServiceException('Token expired');
    }

    return User.fromJson(body);
  }
}
