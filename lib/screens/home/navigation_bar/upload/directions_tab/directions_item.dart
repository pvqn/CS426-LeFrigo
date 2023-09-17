import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model.dart';

class DirectionItem extends StatelessWidget {
  final Direction item;
  const DirectionItem({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Step  ${item.order}',
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              item.description,
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
