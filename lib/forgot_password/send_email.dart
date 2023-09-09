import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendingEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SendingEmailPage(),
    );
  }
}

class SendingEmailPage extends StatefulWidget {
  @override
  _SendingEmailState createState() => _SendingEmailState();
}

class _SendingEmailState extends State<SendingEmailPage> {
  static final Color customColor = Color(0xFFE25E3E);

  final TextEditingController _emailController = TextEditingController();

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
                    onTap: () {},
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
                      'Forgot Password?',
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
                      'Please enter an email so we can',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      'send you a verification code',
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
                          Text('Email',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height:
                                43.0, // Adjust the height of the email input box
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  hintText: 'Enter an email',
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
                                  prefixIcon: Icon(
                                    Icons.email,
                                  )),
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
                                  // Add your button's onPressed behavior here
                                },
                                child: Text('Send reset code',
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
