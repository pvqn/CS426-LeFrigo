import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerifyCodePage();
  }
}

class VerifyCodePage extends StatefulWidget {
  static const Color customColor = Color(0xFFE25E3E);

  const VerifyCodePage({super.key});

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCodePage> {
  final List<TextEditingController> _verifyController = List.generate(
    8, // Replace with the desired number of controllers
    (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const VerifyCodeCustomBackButton(),
                const SizedBox(height: 100),
                const VerifyCodeHeading(),
                const VerifyCodeDescription(),
                const SizedBox(height: 40),
                VerificationCodeFields(controllers: _verifyController),
                const SizedBox(height: 20),
                const ResendCodeText(),
                const SizedBox(height: 50),
                const ContinueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyCodeCustomBackButton extends StatelessWidget {
  const VerifyCodeCustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class VerifyCodeHeading extends StatelessWidget {
  const VerifyCodeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Verification',
      style: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class VerifyCodeDescription extends StatelessWidget {
  const VerifyCodeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Text(
          'We have sent you a code to verify',
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          'your email address',
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class VerificationCodeFields extends StatelessWidget {
  final List<TextEditingController> controllers;

  const VerificationCodeFields({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(8, (index) {
        return SizedBox(
          width: 40,
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: const Color(0xFFE25E3E),
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE25E3E), width: 2.0),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn\'t receive the code?',
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            ' Resend code',
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFE25E3E)),
          ),
        ),
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.router.push(const NewPasswordRoute());
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(VerifyCodePage.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text('Continue',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 15, color: Colors.white))),
      ),
    );
  }
}
