import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  static final Color customColor =
      Color(0xFFE25E3E); // Replace with your desired color code

  const Welcome({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/welcomeImg.png', width: 390, height: 370),
            Container(
              margin:
                  EdgeInsets.only(top: 68.0), // Adjust the top value as needed
              child: SvgPicture.asset(
                'assets/logo.svg',
                width: 104, // Adjust image dimensions as needed
                height: 76,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  'What shall we eat today?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                  ),
                )),
            Container(
                width: 310,
                height: 43,
                margin: EdgeInsets.only(top: 130.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed behavior here
                  },
                  child: Text(
                    'Get Started',
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
                ))
          ],
        ),
      ),
    );
  }
}
