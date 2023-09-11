import 'package:auto_route/auto_route.dart';
import 'package:cs426final/splash/splash.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
      ];
}
