import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/screens/home/custom_grid_view.dart';

class FavoritePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const PageTitle(),
          const SizedBox(height: 25),
          SearchBar(controller: _searchController),
          const SizedBox(height: 30),
          Expanded(child: FavoriteGridView()),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        'Favorite',
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
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

  const SearchBar({super.key, required this.controller});

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
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.search,
            size: 24,
          ),
          const SizedBox(
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
  List<String> dummy = [];

  FavoriteGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyGridView(
        items_id: dummy,
      ),
    );
  }
}
