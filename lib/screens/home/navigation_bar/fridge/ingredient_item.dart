import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientItem extends StatelessWidget {
  final String text;
  final VoidCallback onRemove;

  const IngredientItem({super.key, required this.text, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
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
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(text,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 5),
          InkWell(
            onTap: onRemove,
            child: const Icon(
              Icons.remove_circle,
              color: Color(0xFFE25E3E),
              size: 24,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ]));
  }
}
