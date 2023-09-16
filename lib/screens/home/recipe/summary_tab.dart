import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model.dart';

class SummaryTab extends StatelessWidget {
  final dummy recipe = dummy();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 365,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(recipe.nameRecipe,
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/welcome_bg.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  recipe.nameUser,
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                )),
                Icon(Icons.favorite, color: Colors.black, size: 24),
                SizedBox(
                  width: 5,
                ),
                Text(
                  recipe.likes.toString(),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(recipe.description,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 13, color: Colors.black))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Servings: ',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  recipe.serving.toString(),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 15, color: Colors.black)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('Nutrition facts',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            SizedBox(
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
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.cal.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Fat',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.fat.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Carbs',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.carb.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Protein',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.protein.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
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
