import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40),
          HeaderSection(),
          SizedBox(height: 25),
          SearchBar(),
          SizedBox(height: 30),
          SectionTitle(title: 'Popular now'),
          SizedBox(height: 10),
          RecipeList(),
          SizedBox(height: 30),
          SectionTitle(
            title: 'Discover more categories',
            onTap: () {
              context.router.push(CategoryRoute());
            },
          ),
          SizedBox(height: 10),
          CategoryList(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: HeaderText(),
          ),
          NotificationIcon(),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTextItem(text: 'Bring the'),
        HeaderTextItem(text: 'restaurant'),
        HeaderTextItem(text: 'to your home'),
      ],
    );
  }
}

class HeaderTextItem extends StatelessWidget {
  final String text;

  HeaderTextItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kaiseiOpti(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFF202A44),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

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
          SizedBox(width: 10),
          Icon(
            Icons.search,
            size: 24,
          ),
          SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Recipes',
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 14),
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

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  SectionTitle({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 15, color: Color(0xFF173F4E)),
            ),
          ),
        ),
        GestureDetector(
          child: Text(
            'See all',
            style: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 15, color: Color(0xFF173F4E)),
            ),
          ),
          onTap: onTap,
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<RecipeItem> itemList = [RecipeItem(), RecipeItem()];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Replace with the event you want to trigger when an item is clicked
              context.router.push(RecipeRoute());
            },
            child: RecipeItemWidget(item: itemList[index]),
          );
        },
      ),
    );
  }
}

class RecipeItem {
  String image = 'assets/images/food.png';
  String name = 'antihcmus';
  String time = 'Cook time: 10 mins';
  String nameRecipe = 'Greek Yogurt with Chia Pudding';
  String avatar = 'assets/images/welcome_bg.png';
  int likes = 2000;
}

class RecipeItemWidget extends StatelessWidget {
  final RecipeItem item;

  RecipeItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 15),
      width: 306,
      height: 460,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(item.avatar),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 13),
                        Text(
                          item.name,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    item.likes.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
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
                    width: 180,
                    child: Text(
                      item.nameRecipe,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.time,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  String image = 'assets/images/welcome_bg.png';
  String name = "Breakfast and Brunch";
}

class CategoryList extends StatelessWidget {
  final List<CategoryItem> itemList = [CategoryItem(), CategoryItem()];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.router.push(SelectCategoryRoute());
            },
            child: CategoryItemWidget(item: itemList[index]),
          );
        },
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final CategoryItem item;

  CategoryItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 15),
      width: 280,
      height: 100,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
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
                    width: 180,
                    child: Text(
                      item.name,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
