import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  )
                ],
              ),
              SizedBox(height: 100),
              Text(
                'Reset Password',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Please enter your new password to continue',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40),
              ResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  static final Color customColor = Color(0xFFE25E3E);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResetPasswordTextField(
          labelText: 'New password',
          hintText: 'Enter new password',
          controller: _passwordController,
          isObscured: _isObscured,
          togglePasswordVisibility: _togglePasswordVisibility,
        ),
        SizedBox(height: 25),
        ResetPasswordTextField(
          labelText: 'Retype new password',
          hintText: 'Retype new password',
          controller: _passwordController1,
          isObscured: _isObscured1,
          togglePasswordVisibility: _togglePasswordVisibility1,
        ),
        SizedBox(height: 60),
        Container(
          height: 43,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.router.push(SuccessfulChangedRoute());
            },
            child: Text('Continue',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ))),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(customColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        25.0), // Adjust the radius as needed
                  ),
                )),
          ),
        )
      ],
    );
  }
}

class ResetPasswordTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isObscured;
  final void Function() togglePasswordVisibility;

  ResetPasswordTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.isObscured,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 43.0,
          child: TextField(
            obscureText: isObscured,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              suffixIcon: IconButton(
                onPressed: togglePasswordVisibility,
                icon: Icon(
                  isObscured ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
