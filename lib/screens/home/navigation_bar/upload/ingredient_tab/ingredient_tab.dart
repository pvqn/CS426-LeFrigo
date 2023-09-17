import 'package:flutter/material.dart';
import 'ingredient_item_list.dart';

class IngredientTab extends StatefulWidget {
  const IngredientTab({super.key});

  @override
  _IngredientState createState() => _IngredientState();
}

class _IngredientState extends State<IngredientTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Column(children: [
      IngredientListView(),
    ]));
  }
}
