import 'package:flutter/material.dart';
import 'ingredient_item_list.dart';
import 'model.dart';

class IngredientTab extends StatefulWidget {
  const IngredientTab({super.key, required this.itemList});
  
  final List<ingredient> itemList;

  @override
  IngredientState createState() => IngredientState();
}

class IngredientState extends State<IngredientTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IngredientListView(
        itemList: widget.itemList,
      ),
    ]);
  }
}
