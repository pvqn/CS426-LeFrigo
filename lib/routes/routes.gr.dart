// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    NavigationBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigationBarScreen(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPasswordScreen(),
      );
    },
    RecipeRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecipeScreen(recipeid: args.recipeid),
      );
    },
    SelectCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<SelectCategoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectCategoryScreen(category: args.category),
      );
    },
    SendingEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SendingEmailScreen(),
      );
    },
    SetAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetAccountScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    SuccessfulChangedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessfulChangedScreen(),
      );
    },
    UpdateProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateProfileScreen(),
      );
    },
    UploadRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UploadScreen(),
      );
    },
    VerifyCodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyCodeScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [CategoryScreen]
class CategoryRoute extends PageRouteInfo<void> {
  const CategoryRoute({List<PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NavigationBarScreen]
class NavigationBarRoute extends PageRouteInfo<void> {
  const NavigationBarRoute({List<PageRouteInfo>? children})
      : super(
          NavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPasswordScreen]
class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
          NewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecipeScreen]
class RecipeRoute extends PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute({
    required String recipeid,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeRoute.name,
          args: RecipeRouteArgs(recipeid: recipeid),
          initialChildren: children,
        );

  static const String name = 'RecipeRoute';

  static const PageInfo<RecipeRouteArgs> page = PageInfo<RecipeRouteArgs>(name);
}

class RecipeRouteArgs {
  const RecipeRouteArgs({required this.recipeid});

  final String recipeid;

  @override
  String toString() {
    return 'RecipeRouteArgs{recipeid: $recipeid}';
  }
}

/// generated route for
/// [SelectCategoryScreen]
class SelectCategoryRoute extends PageRouteInfo<SelectCategoryRouteArgs> {
  SelectCategoryRoute({
    required String category,
    List<PageRouteInfo>? children,
  }) : super(
          SelectCategoryRoute.name,
          args: SelectCategoryRouteArgs(category: category),
          initialChildren: children,
        );

  static const String name = 'SelectCategoryRoute';

  static const PageInfo<SelectCategoryRouteArgs> page =
      PageInfo<SelectCategoryRouteArgs>(name);
}

class SelectCategoryRouteArgs {
  const SelectCategoryRouteArgs({required this.category});

  final String category;

  @override
  String toString() {
    return 'SelectCategoryRouteArgs{category: $category}';
  }
}

/// generated route for
/// [SendingEmailScreen]
class SendingEmailRoute extends PageRouteInfo<void> {
  const SendingEmailRoute({List<PageRouteInfo>? children})
      : super(
          SendingEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendingEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetAccountScreen]
class SetAccountRoute extends PageRouteInfo<void> {
  const SetAccountRoute({List<PageRouteInfo>? children})
      : super(
          SetAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuccessfulChangedScreen]
class SuccessfulChangedRoute extends PageRouteInfo<void> {
  const SuccessfulChangedRoute({List<PageRouteInfo>? children})
      : super(
          SuccessfulChangedRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessfulChangedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateProfileScreen]
class UpdateProfileRoute extends PageRouteInfo<void> {
  const UpdateProfileRoute({List<PageRouteInfo>? children})
      : super(
          UpdateProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UploadScreen]
class UploadRoute extends PageRouteInfo<void> {
  const UploadRoute({List<PageRouteInfo>? children})
      : super(
          UploadRoute.name,
          initialChildren: children,
        );

  static const String name = 'UploadRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyCodeScreen]
class VerifyCodeRoute extends PageRouteInfo<void> {
  const VerifyCodeRoute({List<PageRouteInfo>? children})
      : super(
          VerifyCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyCodeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
