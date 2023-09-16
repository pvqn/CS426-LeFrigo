import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

@RoutePage()
class SendingEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SendingEmailPage(),
    );
  }
}

class SendingEmailPage extends StatefulWidget {
  static final Color customColor = Color(0xFFE25E3E);

  @override
  _SendingEmailState createState() => _SendingEmailState();
}

class _SendingEmailState extends State<SendingEmailPage> {
  final TextEditingController _emailController = TextEditingController();

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
                CustomBackButton(),
                Expanded(
                  child: EmailForm(controller: _emailController),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
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

class EmailForm extends StatelessWidget {
  final TextEditingController controller;

  EmailForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        Text(
          'Forgot Password?',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Please enter an email so we can',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'send you a verification code',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 40),
        EmailTextField(controller: controller),
        SizedBox(height: 60),
        ElevatedEmailButton(),
      ],
    );
  }
}

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  EmailTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 43.0,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter an email',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ElevatedEmailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          context.router.push(VerifyCodeRoute());
        },
        child: Text(
          'Send reset code',
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(SendingEmailPage.customColor),
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
