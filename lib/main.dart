import 'package:flutter/material.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/services/get_it.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.currentStatus.status == AuthProviderStatus.unknown) {
      authProvider.onAppStarted();
    }

    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
