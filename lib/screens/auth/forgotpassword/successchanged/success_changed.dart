import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class SuccessfulChangedScreen extends StatelessWidget {
  const SuccessfulChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessfulChangedPage();
  }
}

class SuccessfulChangedPage extends StatelessWidget {
  static const Color customColor = Color(0xFFE25E3E);

  const SuccessfulChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const SuccessContent(),
        ),
      ),
    );
  }
}

class SuccessContent extends StatelessWidget {
  const SuccessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 200,
        ),
        SuccessIcon(),
        SizedBox(height: 10),
        SuccessTitle(),
        SizedBox(height: 5),
        SuccessMessage(),
        SizedBox(height: 50),
        SuccessButton(),
      ],
    );
  }
}

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.verified,
      size: 150,
      color: SuccessfulChangedPage.customColor,
    );
  }
}

class SuccessTitle extends StatelessWidget {
  const SuccessTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Congratulations!',
      style: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your password has been',
          style: GoogleFonts.inter(
            fontSize: 14,
          ),
        ),
        Text(
          'changed successfully',
          style: GoogleFonts.inter(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class SuccessButton extends StatelessWidget {
  const SuccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          context.router.push(const LoginRoute());
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              SuccessfulChangedPage.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text('Done', style: GoogleFonts.poppins(fontSize: 15)),
      ),
    );
  }
}
