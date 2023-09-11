import 'dart:convert';
import 'dart:core';

import 'package:cs426final/core/repos/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = '52.195.170.49:8888';
  final http.Client _client;

  ApiService._() : _client = http.Client();

  static final ApiService _instance = ApiService._();
  factory ApiService() => _instance;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      Uri.http(_baseUrl, '/user/login'),
      body: json.encoder.convert({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decoder.convert(response.body);

      if (body['success'] == true) {
        return body['auth_token'];
      } else {
        throw Exception(body['message']);
      }
    } else {
      throw Exception("Internet Connection Error");
    }
  }

  Future<User> getUser({required String token}) async {
    final response = await _client.get(
      Uri.http(_baseUrl, '/user/profile'),
      headers: {'Authorization': token},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decoder.convert(response.body);

      if (body['_is'] != null) {
        return User.fromJson(body);
      } else {
        throw Exception(body['message']);
      }
    } else {
      throw Exception("Internet Connection Error");
    }
  }
}
