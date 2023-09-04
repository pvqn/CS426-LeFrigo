import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeBackPage(),
    );
  }
}

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackState createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBackPage> {
  static final Color customColor = Color(0xFFE25E3E);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
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
                    Text(
                      'Resume',
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 24,
                        color: Color(0xFFE25E3E),
                      ),
                    ),
                    Text(
                      ' your',
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'culinary adventure',
                style: TextStyle(fontFamily: 'InterBold', fontSize: 24),
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
                        style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height:
                            43.0, // Adjust the height of the email input box
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'xalo@gmail.com',
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
                        style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Forgot password?',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 13, color: Colors.black),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                  width: 310,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button's onPressed behavior here
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
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
                height: 30,
              ),
              SvgPicture.asset(
                'assets/decor1.svg',
                width: 310,
                height: 18,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 310,
                  height: 43,
                  child: OutlinedButton(
                      onPressed: () {
                        // Add your button's onPressed behavior here
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            width: 30.0,
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                color: Color(0xFFE25E3E)),
                          )
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        // Adjust padding
                        side: BorderSide(
                            color: Color(0xFFE25E3E)), // Outline border color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Add rounded corners
                        ),
                      ))),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center horizontally
                  children: [
                    Text(
                      'Do you have an account?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      ' Sign up',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Color(0xFFE25E3E),
                      ),
                    ),
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
