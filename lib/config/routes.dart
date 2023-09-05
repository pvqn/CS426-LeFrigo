import 'package:cs426final/feature/auth/view/log_in.dart';
import 'package:cs426final/feature/welcome/view/welcome.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static final getRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomePage(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const LogInPage(),
          ),
        ],
      ),
      // GoRoute(
      //   path: Routes.signup,
      //   builder: (context, state) => const LogInPage(),
      // ),
    ],
  );
}
