import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/models/recipe.dart';

class IngredientsTab extends StatefulWidget {
  const IngredientsTab({super.key, required this.recipe});

  final Recipe recipe;

  @override
  IngredientsTabState createState() => IngredientsTabState();
}

class IngredientsTabState extends State<IngredientsTab> {
  late List<Ingredients> ingredients = [];

  @override
  void initState() {
    super.initState();
    ingredients = widget.recipe.ingredients;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: 366,
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
                Text('Notes: ',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 14,
                    )))
              ],
            )),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(''),
            //     Text(ingredients[index].quantity,
            //         style: GoogleFonts.poppins(
            //             textStyle: const TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w500))),
            //     const Text(''),
            //   ],
            // ),
            Expanded(child: Container()),
            Center(
              child: Text(ingredients[index].quantity,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))),
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
