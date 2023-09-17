import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lefrigo/screens/screens.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: VerifyCodeRoute.page),
        AutoRoute(page: SuccessfulChangedRoute.page),
        AutoRoute(page: SendingEmailRoute.page),
        AutoRoute(page: NewPasswordRoute.page),
        AutoRoute(page: NavigationBarRoute.page, initial: true),
        AutoRoute(page: RecipeRoute.page),
        AutoRoute(page: CategoryRoute.page),
        AutoRoute(page: SelectCategoryRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: UpdateProfileRoute.page),
        AutoRoute(page: SetAccountRoute.page),
        AutoRoute(page: UploadRoute.page)
      ];
}
