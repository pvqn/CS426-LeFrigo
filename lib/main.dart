import 'package:cs426final/providers.dart';
import 'package:cs426final/routes.dart';
import 'package:cs426final/src/screens/splash/splash_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        home: const SplashScreen(),
        routes: Routes.routes,
      ),
    );
  }
}
