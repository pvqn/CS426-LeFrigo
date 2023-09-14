import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:lefrigo/screens/screens.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: LogInRoute.page),
      ];
}
