import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/services/get_it.dart';

class DirectionsTab extends StatefulWidget {
  final Recipe recipe;

  const DirectionsTab({super.key, required this.recipe});

  @override
  DirectionsTabState createState() => DirectionsTabState();
}

class DirectionsTabState extends State<DirectionsTab> {
  late List<String> _directions;
  final _log = getIt<Logger>(param1: 'DirectionsTab');

  @override
  void initState() {
    super.initState();
    _directions = widget.recipe.directions;
    _log.info(_directions);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _directions.length,
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
                  Text(_directions[index],
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
