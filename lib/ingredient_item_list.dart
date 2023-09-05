import 'package:flutter/material.dart';
import 'package:cs426final/ingredient_item.dart';

class IngredientListView extends StatefulWidget {
  @override
  _IngredientListViewState createState() => _IngredientListViewState();
}

class _IngredientListViewState extends State<IngredientListView> {
  TextEditingController _ingredientController = TextEditingController();
  List<String> itemList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 363.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
              border: Border.all(
                color: Colors.grey.withOpacity(0.5), // Border color
                width: 2.0, // Border width
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 2), // Offset from the top
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _ingredientController,
                    decoration: InputDecoration(
                      hintText: 'Add Ingredient',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.camera_alt,
                    color: Color(0xFFE25E3E),
                    size: 24,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    String newItem = _ingredientController.text;
                    if (newItem.isNotEmpty) {
                      setState(() {
                        itemList.add(newItem);
                        _ingredientController.clear();
                      });
                    }
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Color(0xFFE25E3E),
                    size: 24,
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
          SizedBox(height: 35),
          Container(
            width: 363.0,
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'Current Ingredients',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 363.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return IngredientItem(
                  text: itemList[index],
                  onRemove: () {
                    setState(() {
                      itemList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}