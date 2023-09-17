import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SendingEmailScreen extends StatelessWidget {
  const SendingEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SendingEmailPage();
  }
}

class SendingEmailPage extends StatefulWidget {
  static const Color customColor = Color(0xFFE25E3E);

  const SendingEmailPage({super.key});

  @override
  _SendingEmailState createState() => _SendingEmailState();
}

class _SendingEmailState extends State<SendingEmailPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                const CustomBackButton(),
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
  const CustomBackButton({super.key});

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

class EmailForm extends StatelessWidget {
  final TextEditingController controller;

  const EmailForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Text(
          'Forgot Password?',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
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
        const SizedBox(height: 40),
        EmailTextField(controller: controller),
        const SizedBox(height: 60),
        ElevatedEmailButton(controller: controller),
      ],
    );
  }
}

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({super.key, required this.controller});

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
          const SizedBox(height: 5),
          Consumer<AuthProvider>(builder: (context, auth, _) {
            return SizedBox(
              height: 43.0,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter an email',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ElevatedEmailButton extends StatefulWidget {
  final TextEditingController controller;

  const ElevatedEmailButton({super.key, required this.controller});

  @override
  State<ElevatedEmailButton> createState() => _ElevatedEmailButtonState();
}

class _ElevatedEmailButtonState extends State<ElevatedEmailButton> {
  @override
  void didChangeDependencies() {
    final auth = Provider.of<AuthProvider>(context);

    if (auth.currentStatus.status ==
        AuthNotifierStatus.sendPasswordResetEmailSuccess) {
      context.router.push(const VerifyCodeRoute());
    } else if (auth.currentStatus.status ==
        AuthNotifierStatus.sendPasswordResetEmailFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to send reset code',
            style: GoogleFonts.poppins(fontSize: 15),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return SizedBox(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: () =>
            auth.sendPasswordResetEmail(email: widget.controller.text),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(SendingEmailPage.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text(
          'Send reset code',
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
    );
  }
}
