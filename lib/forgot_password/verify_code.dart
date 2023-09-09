import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerifyCodePage(),
    );
  }
}

class VerifyCodePage extends StatefulWidget {
  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCodePage> {
  static final Color customColor = Color(0xFFE25E3E);
  List<TextEditingController> _verifyController = List.generate(
    8, // Replace with the desired number of controllers
    (_) => TextEditingController(),
  );

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
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Verification',
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
                  'We have sent you a code to verify',
                  style: GoogleFonts.inter(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                Text(
                  'your email address',
                  style: GoogleFonts.inter(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(8, (index) {
                    return Container(
                      width: 40,
                      child: TextField(
                        controller: _verifyController[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        cursorColor: Color(0xFFE25E3E),
                        decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFE25E3E), width: 2.0),
                            // Add rounded corners
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t receive the code?',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500))),
                    GestureDetector(
                      onTap: () {},
                      child: Text(' Resend code',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFE25E3E)))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 43,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle verification logic here
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(customColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Adjust the radius as needed
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
