import 'package:cs426final/data/local/token_service.dart';
import 'package:cs426final/data/remote/api_auth_service.dart';
import 'package:cs426final/repository/auth_repo.dart';
import 'package:cs426final/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  const secureStorage = FlutterSecureStorage();

  final apiAuthService = ApiAuthService();
  final storageService = StorageService(secureStorage);

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => AuthRepository(apiAuthService, storageService),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
    );
  }
}
