import 'package:cs426final/core/repos/model/user.dart';
import 'package:cs426final/core/services/api_service.dart';
import 'package:cs426final/core/services/storage_service.dart';

class UserRepository {
  ApiService _apiService;
  StorageService _storageService;

  User? user;

  UserRepository(this._storageService, this._apiService);

  Future<void> getUser() async {
    final token = await _storageService.getToken();
    user = await _apiService.getUser(token: token!);
  }
}
