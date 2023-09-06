import 'package:http/http.dart' as http;

class HttpClient {
  static const String _baseUrl = '52.195.170.49:8888';
  final http.Client _client;

  HttpClient(this._client);

  Future<http.Response> post({
    required String endpoint,
    Map<String, String>? headers,
    String? body,
  }) async {
    try {
      return await http.post(
        Uri.http(_baseUrl, endpoint),
        headers: headers,
        body: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> get({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    try {
      return await http.get(
        Uri.http(_baseUrl, endpoint),
        headers: headers,
      );
    } catch (e) {
      rethrow;
    }
  }
}
