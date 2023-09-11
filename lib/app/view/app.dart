import 'package:cs426final/app/routes/routes.dart';
import 'package:cs426final/core/services/api_service.dart';
import 'package:cs426final/core/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeFrigo extends StatelessWidget {
  const LeFrigo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => ApiService()),
        RepositoryProvider(create: (_) => StorageService()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
