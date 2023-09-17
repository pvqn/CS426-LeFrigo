import 'package:flutter/material.dart';
import 'ingredient_item_list.dart';

class IngredientTab extends StatefulWidget {
  const IngredientTab({super.key});

  @override
  IngredientState createState() => IngredientState();
}

class IngredientState extends State<IngredientTab> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      IngredientListView(),
    ]);
  }
}
