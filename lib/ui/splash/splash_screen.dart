import 'package:auto_route/auto_route.dart';
import 'package:cs426final/repository/auth_repo.dart';
import 'package:cs426final/routes/routes.dart';
import 'package:cs426final/ui/splash/bloc/check_token_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckTokenBloc, CheckTokenState>(
      bloc: CheckTokenBloc(context.read<AuthRepository>())
        ..add(CheckTokenAppStarted()),
      listener: (context, state) {
        if (state is CheckTokenSuccess) {
          AutoRouter.of(context).replace(const HomeRoute());
        } else if (state is CheckTokenFailed) {
          AutoRouter.of(context).replace(
            state.isFirstTime ? const WelcomeRoute() : const LogInRoute(),
          );
        }
      },
      child: const Placeholder(),
    );
  }
}
