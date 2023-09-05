import 'package:flutter/material.dart';

class dummy {
  String image = 'assets/food.png';
  String name = 'antihcmus';
  String nameRecipe = 'Greek Yogurt with Chia Pudding';
  String avatar = 'assets/welcomeImg.png';
  int likes = 2000;
}

class MyGridView extends StatelessWidget {
  final List<dummy> items = [
    dummy(),
    dummy(), dummy(), dummy(), dummy(), dummy(), dummy(), dummy()
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 158 / 222,

        crossAxisCount: 2, // Number of columns in the grid
        // Spacing between rows
        // Spacing between columns
      ),
      itemCount: items.length, // Use the length of your dynamic list
      itemBuilder: (BuildContext context, int index) {
        return GridItem(item: items[index]);
      },
    );
  }
}

class GridItem extends StatelessWidget {
  final dummy item;

  GridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 158,
      height: 280, // Set a fixed height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 140),
              width: double.infinity, // Expand to full width
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: Text('')),
                  Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    item.likes.toString(),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Container(
              // Wrap text with a Container
              width: double.infinity, // Expand to full width
              child: Text(
                item.nameRecipe,
                style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              // Wrap text with a Container
              width: double.infinity, // Expand to full width
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage(item.avatar),
                  ),
                  SizedBox(width: 5),
                  Text(
                    item.name,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
