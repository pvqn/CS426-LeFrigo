import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String text;
  final VoidCallback onRemove;

  IngredientItem({required this.text, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        width: 363,
        height: 51,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color
            width: 1.0, // Border width
          ),
          borderRadius: BorderRadius.circular(10.0), // Border radius
        ),
        // Margin around the container
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            '$text',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )),
          SizedBox(width: 5),
          InkWell(
            onTap: onRemove,
            child: Icon(
              Icons.remove,
              color: Color(0xFFE25E3E),
              size: 24,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ]));
  }
}
