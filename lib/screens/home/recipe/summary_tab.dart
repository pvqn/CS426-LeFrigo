import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lefrigo/models/recipe.dart';

class SummaryTab extends StatelessWidget {
  final Recipe recipe;

  const SummaryTab({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 365,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(recipe.name,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/welcome_bg.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                  recipe.author ?? 'LeFrigo User',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14)),
                )),
                const Icon(Icons.favorite, color: Colors.black, size: 24),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  recipe.numLiked.toString(),
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(recipe.description,
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 13, color: Colors.black))),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Nutrition facts',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Calories',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.nutrition.calories,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Fat',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.nutrition.fat,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Carbs',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.nutrition.carbs,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Protein',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.nutrition.protein,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
