import 'package:auto_route/auto_route.dart';
import 'package:cs426final/ui/home/home.dart';
import 'package:cs426final/ui/login/login.dart';
import 'package:cs426final/ui/signup/signup.dart';
import 'package:cs426final/ui/splash/splash.dart';
import 'package:cs426final/ui/welcome/welcome.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: LogInRoute.page),
        AutoRoute(page: SignUpRoute.page),
      ];
}
