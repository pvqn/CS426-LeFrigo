import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

enum ApiResponseType { success, failed }

class ApiResponse {
  final ApiResponseType type;
  final String? message;

  ApiResponse(this.type, [this.message]);
}

class ApiService {
  final String _baseUrl = '52.192.217.234:8888'; //'43.207.138.171:8888';

  String token =
      '46a1e3822d785a1335caaff4e74ae24e697d07866f0ce0b7f6c9ab884ac296b2';

  Future<ApiResponse> get({required String path}) async {
    final url = Uri.http(_baseUrl, path);

    var count = 0;
    try {
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
    } catch (_) {
      count = count + 1;
      if (count == 3) {
        rethrow;
      }
    }
    return ApiResponse(ApiResponseType.failed);
  }

  Future<ApiResponse> post({required String path, Map? data}) async {
    final url = Uri.http(_baseUrl, path);

    var count = 0;
    try {
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
    } catch (_) {
      count = count + 1;
      if (count == 3) {
        rethrow;
      }
    }
    return ApiResponse(ApiResponseType.failed);
  }

  String getImageFromId({required String id}) {
    return 'http://$_baseUrl/asset/$id';
  }

  Future<ApiResponse> fetchImageFromId({required String id}) async {
    final url = Uri.http(_baseUrl, '/asset/$id');

    var count = 0;
    try {
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
    } catch (_) {
      count = count + 1;
      if (count == 3) {
        rethrow;
      }
    }
    return ApiResponse(ApiResponseType.failed);
  }
  
  String getImagePathFromId({required String id}) => '/asset/$id';
}
