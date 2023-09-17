import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ingredient_item_list.dart';

class Fridge extends StatelessWidget {
  const Fridge({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FridgePage(),
    );
  }
}

class FridgePage extends StatelessWidget {
  static const Color customColor = Color(0xFFE25E3E);

  const FridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
  const FridgeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
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
  const FindRecipeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 43,
      margin: const EdgeInsets.only(top: 8.0, bottom: 40.0),
      child: ElevatedButton(
        onPressed: () {
          // Add your button's onPressed behavior here
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(FridgePage.customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text(
          'Find the recipe',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
