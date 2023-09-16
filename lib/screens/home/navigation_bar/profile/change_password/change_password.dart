import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangePasswordPage();
  }
}

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  static final Color customColor = Color(0xFFE25E3E);

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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              _buildHeader(context),
              SizedBox(height: 50),
              _buildPasswordField(
                'Old Password',
                _passwordController,
                _isObscured,
                () => _togglePasswordVisibility(0),
              ),
              SizedBox(height: 25),
              _buildPasswordField(
                'New Password',
                _passwordController1,
                _isObscured1,
                () => _togglePasswordVisibility(1),
              ),
              SizedBox(height: 25),
              _buildPasswordField(
                'Retype New Password',
                _passwordController2,
                _isObscured2,
                () => _togglePasswordVisibility(2),
              ),
              SizedBox(height: 40),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Text('Change your password',
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
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
      margin: EdgeInsets.only(left: 20, right: 29),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 43.0,
            child: TextField(
              controller: controller,
              obscureText: isObscured,
              decoration: InputDecoration(
                hintText: 'At least 8 characters',
                hintStyle: GoogleFonts.poppins(fontSize: 13),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFFD9D9D9),
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
      margin: EdgeInsets.only(left: 20, right: 29),
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Continue',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(customColor),
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
