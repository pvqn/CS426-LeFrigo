import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pass_input.dart';
import 'verify_input.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController passwordController = TextEditingController();
    late TextEditingController passwordController1 = TextEditingController();
    late List<TextEditingController> verificationCodeControllers =
        List.generate(
      8,
      (_) => TextEditingController(),
    );
    bool isObscured = true;
    bool isObscured1 = true;

    void togglePasswordVisibility() {
      isObscured = !isObscured;
    }

    void togglePasswordVisibility1() {
      isObscured1 = !isObscured1;
    }

    void resetPassword() {
      bool hasEmpty = false;
      for (int i = 0; i < 8; ++i) {
        hasEmpty = hasEmpty | verificationCodeControllers[i].text.isEmpty;
      }

      String code = '';
      for (int i = 0; i < 8; ++i) {
        code = code + verificationCodeControllers[i].text;
      }
    }

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 100),
              Text(
                'Reset Password',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Please enter your new password and verification code to continue',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              VerificationCodeFields(
                controllers: verificationCodeControllers,
              ),
              const SizedBox(height: 20),
              PasswordInput(
                controller: passwordController,
                labelText: 'New password',
                hintText: 'Enter new password',
                isObscured: isObscured,
                togglePasswordVisibility: togglePasswordVisibility,
              ),
              const SizedBox(height: 25),
              PasswordInput(
                controller: passwordController1,
                labelText: 'Retype new password',
                hintText: 'Retype new password',
                isObscured: isObscured1,
                togglePasswordVisibility: togglePasswordVisibility1,
              ),
              const SizedBox(height: 60),
              SizedBox(
                height: 43,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const SuccessfulChangedRoute());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFE25E3E)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  child: const Text('Continue',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
