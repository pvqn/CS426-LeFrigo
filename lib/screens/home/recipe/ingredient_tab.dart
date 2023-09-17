import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model.dart';

class IngredientsTab extends StatefulWidget {
  const IngredientsTab({super.key});

  @override
  _IngredientsTabState createState() => _IngredientsTabState();
}

class _IngredientsTabState extends State<IngredientsTab> {
  List<ingredient> ingredients = [
    ingredient(),
    ingredient(),
    ingredient(),
    ingredient(),
    ingredient(),
    ingredient(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          width: 366,
          height: 58,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE25E3E).withOpacity(0.2), // Border color
              width: 1.0, // Border width
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ingredients[index].name,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Text('Notes: ${ingredients[index].note}',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 14,
                    )))
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                Text(ingredients[index].quantity,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                const Text(''),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
          ]),
        );
      },
    );
  }
}
