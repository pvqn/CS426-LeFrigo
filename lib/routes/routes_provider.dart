import 'package:cs426final/features/auth/view/auth_welcome.dart';
import 'package:cs426final/features/auth/view/log_in.dart';
import 'package:cs426final/features/auth/view/sign_up.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/auth',
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const WelcomePage(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const LogInPage(),
        ),
        GoRoute(
          path: 'signup',
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),
  ],
);
