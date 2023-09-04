import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangePasswordPage(),
    );
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

  void _togglePasswordVisibility2() {
    setState(() {
      _isObscured2 = !_isObscured2;
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
                margin: EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align to the start (left)
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center horizontally
                  children: [
                    Text(
                      'Change your password',
                      style: TextStyle(fontFamily: 'InterBold', fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Old Password',
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
              SizedBox(height: 16),
              Container(
                  width: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height:
                            43.0, // Adjust the height of the email input box
                        child: TextField(
                          controller: _passwordController1,
                          obscureText: _isObscured1,
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
              SizedBox(height: 16),
              Container(
                  width: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Retype New Password',
                        style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height:
                            43.0, // Adjust the height of the email input box
                        child: TextField(
                          controller: _passwordController2,
                          obscureText: _isObscured2,
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
                                _isObscured1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xFFD9D9D9),
                              ),
                              onPressed: _togglePasswordVisibility2,
                            ), // Adjust padding
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
