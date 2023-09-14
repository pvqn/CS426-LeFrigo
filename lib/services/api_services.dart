import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = '52.195.170.49:8888';

  String? _token;

  set token(String token) {
    _token = token;
  }

  ApiService({String? token}) : _token = token;

  Future<http.Response> get({
    required String path,
  }) async {
    final http.Response response = await http.get(
      Uri.http(_baseUrl, path),
      headers: {
        if (_token != null) 'Authorization': _token!,
      },
    );

    return response;
  }

  Future<http.Response> post({
    required String path,
    required Map<String, String> body,
  }) async {
    final http.Response response = await http.post(
      Uri.http(_baseUrl, path),
      headers: <String, String>{
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': _token!,
      },
      body: json.encode(body),
    );

    return response;
  }
}
