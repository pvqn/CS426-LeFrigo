import 'package:flutter/material.dart';
import 'package:cs426final/custom_grid_view.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoritePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        Text('Favorite',
            style: TextStyle(
                fontFamily: 'InterBold',
                fontSize: 32,
                color: Color(0xff173F4E))),
        SizedBox(
          height: 25,
        ),
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
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Recipes',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: MyGridView(),
        ),
      ]),
    );
  }
}
