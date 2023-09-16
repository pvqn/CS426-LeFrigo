import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ingredient_item_list.dart';

class Fridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FridgePage(),
    );
  }
}

class FridgePage extends StatelessWidget {
  static final Color customColor = Color(0xFFE25E3E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FridgeAppBar(),
          SizedBox(height: 24),
          Expanded(
            child: IngredientListView(),
          ),
          FindRecipeButton(),
        ],
      ),
    );
  }
}

class FridgeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class FindRecipeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 43,
      margin: EdgeInsets.only(top: 8.0, bottom: 40.0),
      child: ElevatedButton(
        onPressed: () {
          // Add your button's onPressed behavior here
        },
        child: Text(
          'Find the recipe',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(FridgePage.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
