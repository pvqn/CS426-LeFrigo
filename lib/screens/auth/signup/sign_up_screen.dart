import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpPage();
  }
}

class SignUpPage extends StatefulWidget {
  static final Color customColor = Color(0xFFE25E3E);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  static final Color customColor = Color(0xFFE25E3E);
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SignUpTitleText(),
              SizedBox(height: 56),
              SignUpEmailInput(controller: _emailController),
              SizedBox(height: 16),
              SignUpPasswordInput(
                controller: _passwordController,
                isObscured: _isObscured,
                togglePasswordVisibility: _togglePasswordVisibility,
              ),
              SizedBox(height: 16),
              SignUpPasswordInput(
                label: 'Retype Password',
                controller: _passwordController1,
                isObscured: _isObscured1,
                togglePasswordVisibility: _togglePasswordVisibility1,
              ),
              SizedBox(height: 50),
              SignUpButton(),
              SizedBox(height: 20),
              SignInText(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpTitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 122),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Start',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: SignUpPage.customColor,
                    ))),
                Text(' your',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ))),
              ],
            ),
            Text(
              'culinary adventure',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
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

  SignUpEmailInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email address',
            style: GoogleFonts.inter(
                textStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 15),
          Container(
            height: 43.0,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'xalo@gmail.com',
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 14,
                )),
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

  SignUpPasswordInput({
    required this.controller,
    required this.isObscured,
    required this.togglePasswordVisibility,
    this.label = 'Password',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
                textStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 15),
          Container(
            height: 43.0,
            child: TextField(
              controller: controller,
              obscureText: isObscured,
              decoration: InputDecoration(
                hintText: 'At least 8 characters',
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 13,
                )),
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
                  icon: Icon(
                    isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFFD9D9D9),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          context.replaceRoute(SetAccountRoute());
          print('ok');
        },
        child: Text('Sign Up',
            style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 14, color: Colors.white))),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(SignUpPage.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 15,
              ))),
          GestureDetector(
            onTap: () {
              context.replaceRoute(LoginRoute());
            },
            child: Text(
              ' Log in',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 15,
                color: SignUpPage.customColor,
              )),
            ),
          )
        ],
      ),
    );
  }
}
