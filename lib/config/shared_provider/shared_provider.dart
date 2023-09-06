import 'package:cs426final/config/network/http_client.dart';
import 'package:cs426final/config/shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// For getting the http.Client
final _httpClientProvider = Provider<http.Client>((ref) => http.Client());

// For the HttpClient class
final httpClientProvider =
    Provider<HttpClient>((ref) => HttpClient(ref.read(_httpClientProvider)));

// For the interface
final sharedPreferenceProvider =
    Provider<SharedPreferenceHelper>((ref) => throw UnimplementedError());
