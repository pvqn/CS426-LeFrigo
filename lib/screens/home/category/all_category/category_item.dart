import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/services/get_it.dart';

class CategoryItem extends StatelessWidget {
  final String text;
  final String? image;
  final String id;

  const CategoryItem({
    super.key,
    this.id = '',
    required this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: 350,
      height: 162,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          // Background Image loaded from API
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: image != null
                    ? NetworkImage(getIt
                        .get<ApiService>()
                        .getImageFromId(id: image.toString()))
                    : const AssetImage('assets/images/food.png')
                        as ImageProvider, // Replace 'your_image.png' with your image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(text,
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
