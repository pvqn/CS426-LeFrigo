import 'package:cs426final/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  static final Color customColor = Color(0xFFE25E3E);
  final TextEditingController _emailController = TextEditingController();
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
          child: Column(
            // Center vertically
            children: [
              Container(
                margin: EdgeInsets.only(top: 122),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center horizontally
                  children: [
                    Text('Start',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE25E3E),
                        ))),
                    Text(' your',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ))),
                  ],
                ),
              ),
              Text(
                'culinary adventure',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(height: 56),
              Container(
                  width: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email address',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height:
                            43.0, // Adjust the height of the email input box
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'xalo@gmail.com',
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 14,
                            )),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD9D9D9), width: 2.0),
                              borderRadius: BorderRadius.circular(
                                  20.0), // Add rounded corners
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(
                                  20.0), // Add rounded corners
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0), // Adjust padding
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 16),
              Container(
                  width: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height:
                            43.0, // Adjust the height of the email input box
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _isObscured,
                          decoration: InputDecoration(
                            hintText: 'At least 8 characters',
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 13,
                            )),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD9D9D9), width: 2.0),
                              borderRadius: BorderRadius.circular(
                                  20.0), // Add rounded corners
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(
                                  20.0), // Add rounded corners
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xFFD9D9D9),
                              ),
                              onPressed: _togglePasswordVisibility,
                            ), // Adjust padding
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 16),
              Container(
                  width: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Retype Password',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      SizedBox(height: 15),
                      Container(
                        height:
                            43.0, // Adjust the height of the email input box
                        child: TextField(
                          controller: _passwordController1,
                          obscureText: _isObscured1,
                          decoration: InputDecoration(
                            hintText: 'At least 8 characters',
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 13,
                            )),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD9D9D9), width: 2.0),
                              borderRadius: BorderRadius.circular(
                                  20.0), // Add rounded corners
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(
                                  20.0), // Add rounded corners
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xFFD9D9D9),
                              ),
                              onPressed: _togglePasswordVisibility1,
                            ), // Adjust padding
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 310,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.push(SetAccountRoute());
                      print('ok');
                    },
                    child: Text('Sign Up',
                        style: GoogleFonts.inter(
                            textStyle:
                                TextStyle(fontSize: 14, color: Colors.white))),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(customColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Adjust the radius as needed
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center horizontally
                  children: [
                    Text('Already have an account?',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 15,
                        ))),
                    GestureDetector(
                      onTap: () {
                        context.router.push(WelcomeBackRoute());
                      },
                      child: Text(
                        ' Log in',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFE25E3E),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
