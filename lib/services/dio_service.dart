import 'package:dio/dio.dart';

class ApiEndPoints {
  ApiEndPoints._();

  static const baseUrl = 'http://52.195.170.49:8888';
  static const login = '/user/login';
  static const register = '/user/register';
  static String infoById(id) => '/user/$id';
  static const currentUser = '/user/profile';
  static const updatePassword = '/user/changepassword';

  static const categories = '/categories';
  static String recipeById(id) => '/recipe/$id';
}

class DioMessage<T extends Object> {
  final T data;

  DioMessage(this.data);
}

class DioFailed {
  final String message;

  DioFailed(this.message);
}

class DioService {
  final Dio _dio;
  Dio get dio => _dio;

  DioService() : _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  void setToken(String token) {
    _dio.options.headers['Authorization'] = token;
  }

  void removeToken() {
    _dio.options.headers.remove('Authorization');
  }

  String? getToken() {
    return _dio.options.headers['Authorization'];
  }
}
