import 'package:cs426final/src/screens/log_in/log_in_ui.dart';
import 'package:cs426final/src/screens/sign_up/sign_up_ui.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  // page variables
  static const log_in = '/log_in';
  static const sign_up = '/sign_up';

  // map for creating page
  static final routes = <String, WidgetBuilder>{
    log_in: (context) => const LogInScreen(),
    sign_up: (context) => const SignUpScreen(),
  };
}
