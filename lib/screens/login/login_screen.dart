import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/utils/app_colors.dart';

part 'login_form.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _LoginSlogan(),
            const SizedBox(height: 55),
            _EmailInput(
                onChanged: (email) => setState(() => this.email = email)),
            const SizedBox(height: 15),
            _PasswordInput(
                onChanged: (password) =>
                    setState(() => this.password = password)),

            // Login Button
            const SizedBox(height: 35),
            Text(
              'Forgot Password?',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(text: 'Don\'t have an account yet? '),
                  TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(color: AppColors.orange),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => context.router.replace(const LoginRoute()),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginSlogan extends StatelessWidget {
  const _LoginSlogan();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Resume ',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.orange,
            ),
            children: const [
              TextSpan(
                  text: 'your\nculinary adventure',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
