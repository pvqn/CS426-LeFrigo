import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ingredient_item_list.dart';

class IngredientTab extends StatefulWidget {
  @override
  _IngredientState createState() => _IngredientState();
}

class _IngredientState extends State<IngredientTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      IngredientListView(),
    ]));
  }
}
