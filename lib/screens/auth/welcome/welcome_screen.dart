import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  static const Color customColor =
      Color(0xFFE25E3E); // Replace with your desired color code

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeContent(),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return const Column(
      children: [
        WelcomeImage(),
        WelcomeLogo(),
        WelcomeText(),
        Expanded(
          child: Center(child: WelcomeButton()),
        ),
      ],
    );
  }
}

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
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
  const WelcomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 68.0),
      child: Image.asset(
        'assets/images/welcome_logo.png',
        width: 104,
        height: 76,
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Text(
        'What shall we eat today?',
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          context.replaceRoute(const LoginRoute());
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(WelcomeScreen.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text(
          'Get Started',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
