import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lefrigo/providers/auth_provider.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).onAppStarted();
  }

  @override
  void didChangeDependencies() {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.currentStatus.status == AuthNotifierStatus.authenticated) {
      context.router.replace(const NavigationBarRoute());
    } else if (authProvider.currentStatus.status ==
        AuthNotifierStatus.inauthenticated) {
      context.router.replace(const WelcomeRoute());
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 120,
        ),
      ),
    );
  }
}
