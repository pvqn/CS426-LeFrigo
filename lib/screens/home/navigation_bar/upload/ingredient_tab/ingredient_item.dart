import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model.dart';

class IngredientItem extends StatelessWidget {
  final ingredient item;
  const IngredientItem({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500))),
            Text('Notes: ${item.note}',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Color(0xFFC4C4C4),
                  fontSize: 14,
                )))
          ],
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(''),
            Text('${item.quantity} ${item.unit}',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500))),
            const Text(''),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ]),
    );
  }
}
