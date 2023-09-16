import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class VerifyCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerifyCodePage();
  }
}

class VerifyCodePage extends StatefulWidget {
  static final Color customColor = Color(0xFFE25E3E);

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCodePage> {
  List<TextEditingController> _verifyController = List.generate(
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
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(height: 40),
                VerifyCodeCustomBackButton(),
                SizedBox(height: 100),
                VerifyCodeHeading(),
                VerifyCodeDescription(),
                SizedBox(height: 40),
                VerificationCodeFields(controllers: _verifyController),
                SizedBox(height: 20),
                ResendCodeText(),
                SizedBox(height: 50),
                ContinueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyCodeCustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class VerifyCodeHeading extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
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

  VerificationCodeFields({required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(8, (index) {
        return Container(
          width: 40,
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: Color(0xFFE25E3E),
            decoration: InputDecoration(
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
                color: Color(0xFFE25E3E)),
          ),
        ),
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.router.push(NewPasswordRoute());
        },
        child: Text('Continue',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 15, color: Colors.white))),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(VerifyCodePage.customColor),
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
