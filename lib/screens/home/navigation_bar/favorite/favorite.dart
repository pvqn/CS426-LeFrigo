import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/screens/home/custom_grid_view.dart';

class FavoritePage extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          PageTitle(),
          SizedBox(height: 25),
          SearchBar(controller: _searchController),
          SizedBox(height: 30),
          Expanded(child: FavoriteGridView()),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        'Favorite',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xff173F4E),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;

  SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            size: 24,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search Recipes',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyGridView(),
    );
  }
}
