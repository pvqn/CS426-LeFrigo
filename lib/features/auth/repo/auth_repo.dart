import 'dart:convert';
import 'dart:developer' as developer;

import 'package:cs426final/config/network/http_client.dart';
import 'package:cs426final/config/shared_model/user.dart';
import 'package:cs426final/config/shared_preferences/shared_preferences.dart';
import 'package:cs426final/config/shared_provider/shared_provider.dart';
import 'package:cs426final/features/auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class _IAuthRepo {
  Future<AuthState> login(String email, String password);

  Future<AuthState> signup(String email, String password);

  Future<AuthState> completeUserInfo(User newInfo, String token);
}

class AuthRepo implements _IAuthRepo {
  final HttpClient _httpClient;
  final SharedPreferenceHelper _sharedPreferenceHelper;

  AuthRepo(this._httpClient, this._sharedPreferenceHelper);

  @override
  Future<AuthState> completeUserInfo(User newInfo, String token) async {
    final convert = newInfo.toJson();

    final body = json.encode({
      'dob': convert['dob'],
      'country': convert['country'],
      'username': convert['username'],
      'email': convert['email'],
    });

    final updateResponse = await _httpClient.post(
      endpoint: 'user/profile',
      headers: {
        'Authorization': token,
        'Content-type': 'application/json',
      },
      body: body,
    );

    Map<String, dynamic> decode = json.decode(updateResponse.body);

    if (decode['success']) {
      return AuthState.loggedIn(
        token: token,
        complete: IsInfoComplete.complete,
      );
    } else {
      return AuthState.failed(decode['message']);
    }
  }

  @override
  Future<AuthState> login(String email, String password) async {
    String credential = json.encode({
      'email': email,
      'password': password,
    });

    final logInResponse = await _httpClient.post(
      endpoint: 'user/login',
      body: credential,
      headers: {'Content-Type': 'application/json'},
    );

    Map<String, dynamic> decode = json.decode(logInResponse.body);

    if (decode['success']) {
      developer.log('User valid');

      String token = decode['auth_token'];

      final checkCompleteResponse = await _httpClient
          .get(endpoint: 'user/profile', headers: {'Authorization': token});

      final user = User.fromJson(json.decode(checkCompleteResponse.body));

      // await _sharedPreferenceHelper.saveUser(email: email, password: password);
      // await _sharedPreferenceHelper.saveToken(authToken: token);

      developer.log('${isUserComplete(user)}');

      return AuthState.loggedIn(
        token: token,
        complete: isUserComplete(user)
            ? IsInfoComplete.complete
            : IsInfoComplete.incomplete,
      );
    } else {
      developer.log('User invalid');
      return AuthState.failed(decode['message']);
    }
  }

  @override
  Future<AuthState> signup(String email, String password) async {
    final credential = json.encode({
      'email': email,
      'password': password,
    });

    final signUpResponse = await _httpClient.post(
      endpoint: 'user/register',
      body: credential,
      headers: {'Content-Type': 'application/json'},
    );

    Map<String, dynamic> decode = json.decode(signUpResponse.body);

    if (decode['success']) {
      final logInResponse = await _httpClient.post(
        endpoint: 'user/login',
        body: credential,
        headers: {'Content-type': 'application/json'},
      );

      Map<String, dynamic> loginJson = json.decode(logInResponse.body);

      String token = loginJson['auth_token'];

      // await _sharedPreferenceHelper.saveUser(email: email, password: password);
      // await _sharedPreferenceHelper.saveToken(authToken: token);

      return AuthState.loggedIn(
        token: token,
        complete: IsInfoComplete.incomplete,
      );
    } else {
      return AuthState.failed(decode['message']);
    }
  }

  bool isUserComplete(User user) =>
      !(user.country == null || user.dob == null || user.username == null);
}

final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepo(
      ref.read(httpClientProvider),
      ref.read(sharedPreferenceProvider),
    ));
