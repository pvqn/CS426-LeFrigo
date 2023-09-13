import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:cs426final/fridge/view/ingredient_item_list.dart';
import 'package:google_fonts/google_fonts.dart';

class Fridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FridgePage(),
    );
  }
}

class FridgePage extends StatefulWidget {
  @override
  _FridgeState createState() => _FridgeState();
}

class _FridgeState extends State<FridgePage> {
  static final Color customColor = Color(0xFFE25E3E);
  final TextEditingController _ingredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align to the start (left)
                children: [
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              // Wrap IngredientListView with Expanded
              child: IngredientListView(),
            ),
            Container(
                width: 350,
                height: 43,
                margin: EdgeInsets.only(top: 8.0, bottom: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed behavior here
                  },
                  child: Text('Find the recipe',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ))),
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
                )),
          ],
        ),
      ),
    );
  }
}
