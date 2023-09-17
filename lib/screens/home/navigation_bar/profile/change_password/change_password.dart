import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChangePasswordPage();
  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePasswordPage> {
  static const Color customColor = Color(0xFFE25E3E);

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  bool _isObscured = true;
  bool _isObscured1 = true;
  bool _isObscured2 = true;

  void _togglePasswordVisibility(int fieldIndex) {
    setState(() {
      if (fieldIndex == 0) {
        _isObscured = !_isObscured;
      } else if (fieldIndex == 1) {
        _isObscured1 = !_isObscured1;
      } else if (fieldIndex == 2) {
        _isObscured2 = !_isObscured2;
      }
    });
  }

  void updatePassword() {
    if (_passwordController1.text != _passwordController2.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
    } else {
      Provider.of<AuthProvider>(context, listen: false)
          .updatePassword(_passwordController.text, _passwordController1.text)
          .then((_) {
        if (Provider.of<AuthProvider>(context, listen: false)
                .currentStatus
                .status ==
            AuthNotifierStatus.logOut) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Password updated successfully. Please login again'),
            ),
          );
          context.router.pushAndPopUntil(
            const WelcomeRoute(),
            predicate: (_) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password update failed'),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 50),
              _buildPasswordField(
                'Old Password',
                _passwordController,
                _isObscured,
                () => _togglePasswordVisibility(0),
              ),
              const SizedBox(height: 25),
              _buildPasswordField(
                'New Password',
                _passwordController1,
                _isObscured1,
                () => _togglePasswordVisibility(1),
              ),
              const SizedBox(height: 25),
              _buildPasswordField(
                'Retype New Password',
                _passwordController2,
                _isObscured2,
                () => _togglePasswordVisibility(2),
              ),
              const SizedBox(height: 40),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Text('Change your password',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
          ],
        ));
  }

  Widget _buildPasswordField(
    String labelText,
    TextEditingController controller,
    bool isObscured,
    Function toggleVisibility,
  ) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 29),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 43.0,
            child: TextField(
              controller: controller,
              obscureText: isObscured,
              decoration: InputDecoration(
                hintText: 'At least 8 characters',
                hintStyle: GoogleFonts.poppins(fontSize: 13),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFFD9D9D9),
                  ),
                  onPressed: () => toggleVisibility(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 29),
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text(
          'Continue',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
