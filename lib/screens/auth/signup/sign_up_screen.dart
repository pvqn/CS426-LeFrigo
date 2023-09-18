import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/providers/auth_provider.dart';
import 'package:provider/provider.dart';


@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpPage();
  }
}

class SignUpPage extends StatefulWidget {
  static const Color customColor = Color(0xFFE25E3E);

  const SignUpPage({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpPage> {
  static const Color customColor = Color(0xFFE25E3E);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  bool _isObscured = true;
  bool _isObscured1 = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _togglePasswordVisibility1() {
    setState(() {
      _isObscured1 = !_isObscured1;
    });
  }

  void onPress() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _passwordController1.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (_passwordController.text != _passwordController1.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password does not match'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Provider.of<AuthProvider>(context, listen: false).login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SignUpTitleText(),
              const SizedBox(height: 56),
              SignUpEmailInput(controller: _emailController),
              const SizedBox(height: 16),
              SignUpPasswordInput(
                controller: _passwordController,
                isObscured: _isObscured,
                togglePasswordVisibility: _togglePasswordVisibility,
              ),
              const SizedBox(height: 16),
              SignUpPasswordInput(
                label: 'Retype Password',
                controller: _passwordController1,
                isObscured: _isObscured1,
                togglePasswordVisibility: _togglePasswordVisibility1,
              ),
              const SizedBox(height: 50),
              const SignUpButton(),
              const SizedBox(height: 20),
              const SignInText(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpTitleText extends StatelessWidget {
  const SignUpTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 122),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Start',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: SignUpPage.customColor,
                    ))),
                Text(' your',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ))),
              ],
            ),
            Text(
              'culinary adventure',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
            ),
          ],
        ));
  }
}

class SignUpEmailInput extends StatelessWidget {
  final TextEditingController controller;

  const SignUpEmailInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email address',
            style: GoogleFonts.inter(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 43.0,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'xalo@gmail.com',
                hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 14,
                )),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpPasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscured;
  final Function togglePasswordVisibility;
  final String label;

  const SignUpPasswordInput({
    super.key,
    required this.controller,
    required this.isObscured,
    required this.togglePasswordVisibility,
    this.label = 'Password',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 43.0,
            child: TextField(
              controller: controller,
              obscureText: isObscured,
              decoration: InputDecoration(
                hintText: 'At least 8 characters',
                hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 13,
                )),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 12.0),
                suffixIcon: IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFFD9D9D9),
                  ),
                  onPressed: () => togglePasswordVisibility(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          context.replaceRoute(const SetAccountRoute());
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(SignUpPage.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text('Sign Up',
            style: GoogleFonts.inter(
                textStyle: const TextStyle(fontSize: 14, color: Colors.white))),
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 15,
            ))),
        GestureDetector(
          onTap: () {
            context.replaceRoute(const LoginRoute());
          },
          child: Text(
            ' Log in',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 15,
              color: SignUpPage.customColor,
            )),
          ),
        )
      ],
    );
  }
}
