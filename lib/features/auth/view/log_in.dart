import 'dart:developer' as developer;

import 'package:cs426final/config/constants/app_colors.dart';
import 'package:cs426final/features/auth/provider/auth_provider.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  @override
  ConsumerState createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  String? _email;
  String? _password;

  @override
  void initState() {
    super.initState();
    ref.read(authNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider.notifier);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 25,
                left: 15,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 23,
                  ),
                  onPressed: () => context.go('/auth'),
                )),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _SloganWidget(),
                  const SizedBox(height: 56),
                  _CustomTextInput(
                    title: 'Email',
                    onChange: (email) => setState(() => _email = email),
                    placeHolder: 'Enter your email',
                  ),
                  const SizedBox(height: 17),
                  _CustomTextInput(
                    title: 'Password',
                    isPassword: true,
                    onChange: (password) =>
                        setState(() => _password = password),
                    placeHolder: 'min. 8 characters',
                  ),
                  const SizedBox(height: 55),
                  GestureDetector(
                    onTap: () {
                      if (_email != null && _password != null) {
                        auth.login(_email!, _password!);
                      } else {
                        developer.log('invalid info');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Center(
                        child: Text(
                          "Log In",
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
                            ..onTap = () => context.go('/auth/signup'),
                        )
                      ],
                    ),
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

class _SloganWidget extends StatelessWidget {
  const _SloganWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Column(
        children: [
          Expanded(child: Container()),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Resume ',
                        style: TextStyle(color: AppColors.orange)),
                    TextSpan(text: 'your\nculinary adventure')
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTextInput extends StatefulWidget {
  final bool isPassword;
  final String title;
  final ValueChanged<String>? onChange;
  final String? placeHolder;

  const _CustomTextInput({
    Key? key,
    this.isPassword = false,
    required this.title,
    this.placeHolder = 'Input text here...',
    this.onChange,
  }) : super(key: key);

  @override
  State<_CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<_CustomTextInput> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = !widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final textInputBorderStyle = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gray, width: 2.0),
      borderRadius: BorderRadius.circular(20),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              widget.title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: TextField(
              onChanged: widget.onChange,
              obscureText: widget.isPassword,
              style: GoogleFonts.poppins(fontSize: 13),
              decoration: InputDecoration(
                hintText: widget.placeHolder,
                hintStyle: GoogleFonts.poppins(fontSize: 13),
                border: textInputBorderStyle,
                focusedBorder: textInputBorderStyle,
                contentPadding: const EdgeInsets.only(left: 15.0),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(_isObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: AppColors.gray,
                        onPressed: () =>
                            setState(() => _isObscured = !_isObscured),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
