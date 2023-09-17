import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model.dart';

class DirectionsTab extends StatefulWidget {
  const DirectionsTab({super.key});

  @override
  _DirectionsTabState createState() => _DirectionsTabState();
}

class _DirectionsTabState extends State<DirectionsTab> {
  List<String> directions = [
    dummy().description,
    dummy().description,
    dummy().description
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: directions.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(10),
            width: 366,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Border color
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Step ${index + 1}',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(directions[index],
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ))),
                ],
              ),
            ));
      },
    );
  }
}
