import 'package:auto_route/auto_route.dart';
import 'package:cs426final/splash/splash.dart';
import 'package:cs426final/welcome/welcome.dart';
import 'package:cs426final/sign_up/sign_up.dart';
import 'package:cs426final/welcome_back/welcome_back.dart';
import 'package:cs426final/set_up_acc/set_up_acc.dart';
import 'package:cs426final/navigation_bar/navigation_bar.dart';
import 'package:cs426final/recipe/recipe.dart';
import 'package:cs426final/category/all_category/all_category.dart';
import 'package:cs426final/category/selected_category/selected_category.dart';
import 'package:cs426final/edit_profile/update_profile/update_profile.dart';
import 'package:cs426final/edit_profile/change_password/change_password.dart';
import 'package:cs426final/forgot_password/password/password.dart';
import 'package:cs426final/forgot_password/send_email/send_email.dart';
import 'package:cs426final/forgot_password/success_changed/success_changed.dart';
import 'package:cs426final/forgot_password/verify_code/verify_code.dart';
part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
        ),
        AutoRoute(page: WelcomeRoute.page, initial: true),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: WelcomeBackRoute.page,
        ),
        AutoRoute(
          page: SetAccountRoute.page,
        ),
        AutoRoute(page: NavigationBarRoute.page),
        AutoRoute(page: RecipeRoute.page),
        AutoRoute(page: CategoryRoute.page),
        AutoRoute(page: SelectCategoryRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: UpdateProfileRoute.page),
        AutoRoute(page: SendingEmailRoute.page),
        AutoRoute(page: SuccessfulChangedRoute.page),
        AutoRoute(page: VerifyCodeRoute.page),
        AutoRoute(page: NewPasswordRoute.page),
      ];
}
