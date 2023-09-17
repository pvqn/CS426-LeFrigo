import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const HeaderSection(),
          const SizedBox(height: 25),
          SearchBar(),
          const SizedBox(height: 30),
          const SectionTitle(title: 'Popular now'),
          const SizedBox(height: 10),
          RecipeList(),
          const SizedBox(height: 30),
          SectionTitle(
            title: 'Discover more categories',
            onTap: () {
              context.router.push(const CategoryRoute());
            },
          ),
          const SizedBox(height: 10),
          CategoryList(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
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
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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

  const HeaderTextItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kaiseiOpti(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF202A44),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

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
                offset: const Offset(0, 2),
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

  SearchBar({super.key});

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
          const SizedBox(width: 10),
          const Icon(
            Icons.search,
            size: 24,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Recipes',
                hintStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 14),
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

  const SectionTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              textStyle:
                  const TextStyle(fontSize: 15, color: Color(0xFF173F4E)),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: GoogleFonts.inter(
              textStyle:
                  const TextStyle(fontSize: 15, color: Color(0xFF173F4E)),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<RecipeItem> itemList = [RecipeItem(), RecipeItem()];

  RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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

  const RecipeItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 15),
      width: 306,
      height: 460,
      decoration: const BoxDecoration(),
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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(item.avatar),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 13),
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
                  const Icon(
                    Icons.favorite,
                    size: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    item.likes.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                  const SizedBox(height: 10),
                  Text(
                    item.time,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
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

  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // context.router.push(SelectCategoryRoute());
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

  const CategoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 15),
      width: 280,
      height: 100,
      decoration: const BoxDecoration(),
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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
