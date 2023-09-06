import 'package:cs426final/config/shared_preferences/shared_preferences.dart';
import 'package:cs426final/config/shared_provider/shared_provider.dart';
import 'package:cs426final/routes/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  final sharedPreference = await SharedPreferences.getInstance();

  runApp(ProviderScope(overrides: [
    sharedPreferenceProvider.overrideWithValue(
        SharedPreferenceHelper(sharedPreference, secureStorage)),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
