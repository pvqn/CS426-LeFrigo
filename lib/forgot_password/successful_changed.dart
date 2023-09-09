import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessfulChanged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SuccessfulChangedPage(),
    );
  }
}

class SuccessfulChangedPage extends StatefulWidget {
  @override
  _SuccessfulChangedState createState() => _SuccessfulChangedState();
}

class _SuccessfulChangedState extends State<SuccessfulChangedPage> {
  static final Color customColor = Color(0xFFE25E3E);

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
                height: 200,
              ),
              Expanded(
                  child: Column(
                children: [
                  Icon(
                    Icons.verified,
                    size: 150,
                    color: Color(0xFFE25E3E),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Congratulations!',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Your password has been',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 14,
                    )),
                  ),
                  Text(
                    'changed successfully',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 14,
                    )),
                  )
                ],
              )),
              Container(
                  width: double.infinity,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button's onPressed behavior here
                    },
                    child:
                        Text('Done', style: GoogleFonts.poppins(fontSize: 15)),
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
                height: 150,
              )
            ],
          ),
        )),
      ),
    );
  }
}
