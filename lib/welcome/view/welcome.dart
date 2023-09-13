import 'package:cs426final/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  static final Color customColor =
      Color(0xFFE25E3E); // Replace with your desired color code

  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset('welcomeImg.png', width: double.infinity, height: 370),
            Container(
              margin:
                  EdgeInsets.only(top: 68.0), // Adjust the top value as needed
              child: SvgPicture.asset(
                'logo.svg',
                width: 104, // Adjust image dimensions as needed
                height: 76,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text('What shall we eat today?',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 15.0,
                    )))),
            Container(
                width: 310,
                height: 43,
                margin: EdgeInsets.only(top: 130.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.pushRoute(SignUpRoute());
                  },
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    )),
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
                ))
          ],
        ),
      ),
    );
  }
}
