import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        Container(
          width: 344,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bring the',
                        style: TextStyle(
                            fontFamily: 'KaiseiOpti',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF202A44)
                            // Set text direction to left-to-right
                            ),
                      ),
                      Text(
                        'restaurant',
                        style: TextStyle(
                            fontFamily: 'KaiseiOpti',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF202A44)
                            // Set text direction to left-to-right
                            ),
                      ),
                      Text(
                        'to your home',
                        style: TextStyle(
                            fontFamily: 'KaiseiOpti',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF202A44)
                            // Set text direction to left-to-right
                            ),
                      ),
                    ]),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
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
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black.withOpacity(0.5),
                  size: 30,
                ),
              ),
            ]),
          ]),
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              'Popular now',
              style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 15,
                  color: Color(0xFF173F4E)),
            )),
            Text(
              'See all',
              style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 15,
                  color: Color(0xFF173F4E)),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        Container(
          height: 460, // Adjust the height as needed
          child: CustomHorizontalListViewRecipe(),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              'Discover more categories',
              style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 15,
                  color: Color(0xFF173F4E)),
            )),
            Text(
              'See all',
              style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 15,
                  color: Color(0xFF173F4E)),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        Container(
          height: 180, // Adjust the height as needed
          child: CustomHorizontalListViewCat(),
        ),
      ]),
    );
  }
}

class dummy {
  String image = 'assets/food.png';
  String name = 'antihcmus';
  String time = 'Cook time: 10 mins';
  String nameRecipe = 'Greek Yogurt with Chia Pudding';
  String avatar = 'assets/welcomeImg.png';
  int likes = 2000;
}

class CustomHorizontalListViewRecipe extends StatelessWidget {
  final List<dummy> itemList = [dummy(), dummy()];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Replace with the event you want to trigger when an item is clicked
            print('Item ${itemList[index]} clicked');
          },
          child: CustomItemRecipeWidget(item: itemList[index]),
        );
      },
    );
  }
}

class CustomItemRecipeWidget extends StatelessWidget {
  final dummy item;

  CustomItemRecipeWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 15),
      width: 306,
      height: 460,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(
                    item.image), // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                        radius: 20, backgroundImage: AssetImage(item.avatar)),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          item.name,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                    Icon(
                      Icons.favorite,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      item.likes.toString(),
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                )),
          ),
          Positioned(
            left: 5,
            bottom: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // Wrap text with a Container
                      width: 180, // Set your fixed width here
                      child: Text(
                        item.nameRecipe,
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.time,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class dummy1 {
  String image = 'assets/welcomeImg.png';
  String name = "Breakfast and Brunch";
}

class CustomHorizontalListViewCat extends StatelessWidget {
  final List<dummy1> itemList = [dummy1(), dummy1()];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Replace with the event you want to trigger when an item is clicked
            print('Item ${itemList[index]} clicked');
          },
          child: CustomItemCatWidget(item: itemList[index]),
        );
      },
    );
  }
}

class CustomItemCatWidget extends StatelessWidget {
  final dummy1 item;

  CustomItemCatWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 15),
      width: 280,
      height: 100,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(
                    item.image), // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content

          Positioned(
            left: 5,
            bottom: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // Wrap text with a Container
                      width: 180, // Set your fixed width here
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
