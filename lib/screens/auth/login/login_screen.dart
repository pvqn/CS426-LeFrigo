import 'package:lefrigo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeBackPage(),
    );
  }
}

class WelcomeBackPage extends StatefulWidget {
  static final Color customColor = Color(0xFFE25E3E);

  @override
  _WelcomeBackState createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBackPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TitleText(),
              SizedBox(height: 56),
              EmailInput(),
              SizedBox(height: 16),
              PasswordInput(),
              SizedBox(height: 20),
              ForgotPasswordText(),
              SizedBox(height: 7),
              LoginButton(),
              SizedBox(height: 30),
              DecorImage(),
              SizedBox(height: 30),
              GoogleSignInButton(),
              SizedBox(height: 20),
              SignUpText(),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 122),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Resume',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFE25E3E),
                            fontWeight: FontWeight.bold))),
                Text(' your',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)))
              ],
            ),
            Text(
              'culinary adventure',
              style: GoogleFonts.inter(
                  textStyle:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email address',
              style: GoogleFonts.inter(
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          SizedBox(height: 15),
          Container(
            height: 43.0,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'xalo@gmail.com',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    _isObscured = !_isObscured;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: GoogleFonts.inter(
                textStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 15),
          Container(
            height: 43.0,
            child: TextField(
              controller: _passwordController,
              obscureText: _isObscured,
              decoration: InputDecoration(
                hintText: 'At least 8 characters',
                hintStyle:
                    GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
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
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFFD9D9D9),
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(SendingEmailRoute());
      },
      child: Text(
        'Forgot password?',
        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13)),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          context.replaceRoute(NavigationBarRoute());
        },
        child: Text(
          'Log in',
          style: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 15, color: Colors.white)),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(WelcomeBackPage.customColor),
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

class DecorImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/decor1.svg',
      width: 310,
      height: 18,
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 43,
      child: OutlinedButton(
        onPressed: () {
          // Handle Google Sign In
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              width: 30.0,
              height: 30.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'Continue with Google',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15, color: WelcomeBackPage.customColor)),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: WelcomeBackPage.customColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you have an account?',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.replaceRoute(SignUpRoute());
            },
            child: Text(
              ' Sign up',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15,
                  color: WelcomeBackPage.customColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
