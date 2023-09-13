import 'package:auto_route/auto_route.dart';
import 'package:cs426final/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewPasswordPage(),
    );
  }
}

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPasswordPage> {
  static final Color customColor = Color(0xFFE25E3E);

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  bool _isObscured = true;
  bool _isObscured1 = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _togglePasswordVisibility1() {
    setState(() {
      _isObscured1 = !_isObscured1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Set your desired text direction
      child: Scaffold(
        body: Center(
            child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            // Center vertically
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
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
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Reset Password',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Please enter your new password to continue',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('New password',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height:
                                43.0, // Adjust the height of the email input box
                            child: TextField(
                              obscureText: _isObscured,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: 'Enter new password',
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize:
                                        13 // Apply the same font family to the label text
                                    ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD9D9D9), width: 2.0),
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Add rounded corners
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Add rounded corners
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 12.0),
                                suffixIcon: IconButton(
                                    onPressed: _togglePasswordVisibility,
                                    icon: Icon(
                                      _isObscured
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text('Retype new password',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height:
                                43.0, // Adjust the height of the email input box
                            child: TextField(
                              obscureText: _isObscured1,
                              controller: _passwordController1,
                              decoration: InputDecoration(
                                hintText: 'Retype new password',
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize:
                                        13 // Apply the same font family to the label text
                                    ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD9D9D9), width: 2.0),
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Add rounded corners
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Add rounded corners
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 12.0),
                                suffixIcon: IconButton(
                                    onPressed: _togglePasswordVisibility1,
                                    icon: Icon(
                                      _isObscured1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                              width: double.infinity,
                              height: 43,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.router.push(SuccessfulChangedRoute());
                                },
                                child: Text('Reset password',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          customColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0), // Adjust the radius as needed
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
