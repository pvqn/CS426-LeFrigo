import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'pass_input.dart';
import 'verify_input.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class VerifyCodeScreen extends StatefulWidget {
  final String email;

  const VerifyCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordController1 = TextEditingController();
  late List<TextEditingController> verificationCodeControllers = List.generate(
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
    bool hasEmpty =
        passwordController.text.isEmpty | passwordController1.text.isEmpty;
    for (int i = 0; i < 8; ++i) {
      hasEmpty = hasEmpty | verificationCodeControllers[i].text.isEmpty;
    }

    if (hasEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (passwordController.text != passwordController1.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password does not match'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    String code = '';
    for (int i = 0; i < 8; ++i) {
      code = code + verificationCodeControllers[i].text;
    }
    Provider.of<AuthProvider>(context, listen: false).resetPassword(
      email: 'codechl02@gmail.com',
      password: passwordController.text,
      code: code,
    );
  }

  @override
  void didChangeDependencies() {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.currentStatus.status ==
        AuthNotifierStatus.resetPasswordSuccess) {
      authProvider.resetStatus();
      context.router.replace(const SuccessfulChangedRoute());
    } else if (authProvider.currentStatus.status ==
        AuthNotifierStatus.resetPasswordFailed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid or expired code'),
          duration: Duration(seconds: 2),
        ));
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: resetPassword,
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
