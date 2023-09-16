import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/utils/app_colors.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  static final Color customColor =
      Color(0xFFE25E3E); // Replace with your desired color code

  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WelcomeContent(),
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        WelcomeImage(),
        WelcomeLogo(),
        WelcomeText(),
        WelcomeButton(),
      ],
    );
  }
}

class WelcomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Image.asset(
        'assets/images/welcome_bg.png',
        width: double.infinity,
        height: 370,
        fit: BoxFit.cover,
      ),
    );
  }
}

class WelcomeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 68.0),
      child: Image.asset(
        'assets/images/welcome_logo.png',
        width: 104,
        height: 76,
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Text(
        'What shall we eat today?',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 43,
      margin: EdgeInsets.only(top: 130.0),
      child: ElevatedButton(
        onPressed: () {
          context.replaceRoute(LoginRoute());
        },
        child: Text(
          'Get Started',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(WelcomeScreen.customColor),
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
