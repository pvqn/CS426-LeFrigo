import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';
import 'category_item.dart';

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  List<CategoryItem> itemList = [
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
    CategoryItem(
        id: '1', text: 'Breakfast', image: 'assets/images/welcome_bg.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: CategoryItem(
                    text: itemList[index].text,
                    image: itemList[index].image,
                    id: itemList[index].id),
                onTap: () {
                  context.router.push(SelectCategoryRoute());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
