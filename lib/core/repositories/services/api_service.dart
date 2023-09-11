import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = '52.195.170.49:8888';
  final http.Client _client;

  ApiService(this._client);

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        Uri.http(_baseUrl, '/user/login'),
        body: {
          'email': email,
          'password': password,
        },
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
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
