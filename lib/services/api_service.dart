import 'dart:convert';

import 'package:http/http.dart' as http;

enum ApiResponseType { success, failed }

class ApiResponse {
  final ApiResponseType type;
  final String? message;

  ApiResponse(this.type, [this.message]);
}

class ApiService {  
  final String _baseUrl = '52.192.217.234:8888'; //'43.207.138.171:8888';

  String token = '33e22a4919f6e1ea8d59a96803f6faeab02605afcc43aa2107deb4fc0ea5eebc';

  Future<ApiResponse> get({required String path}) async {
    final url = Uri.http(_baseUrl, path);

    final response = await http.get(
      url,
      headers: {
        if (token != '') 'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      return ApiResponse(ApiResponseType.success, response.body);
    } else {
      return ApiResponse(ApiResponseType.failed);
    }
  }

  Future<ApiResponse> post({required String path, Map? data}) async {
    final url = Uri.http(_baseUrl, path);

    final response = await http.post(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data ?? "{}"),
    );

    if (response.statusCode == 200) {
      return ApiResponse(ApiResponseType.success, response.body);
    } else {
      return ApiResponse(ApiResponseType.failed);
    }
  }

  String getImageFromId({required String id}) {
    final url = Uri.http(_baseUrl, '/asset/$id');

    return url.toString();
  }
}
