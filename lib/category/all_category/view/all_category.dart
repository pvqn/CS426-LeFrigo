import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:cs426final/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  static final Color customColor = Color(0xFFE25E3E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the start (left)
              children: [
                InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            // Use the CategoryListView widget directly
            child: CategoryListView(),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String text;
  final String image;
  final String id;

  CategoryItem({required this.id, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                image: AssetImage(
                    image), // Replace 'your_image.png' with your image asset path
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  List<CategoryItem> itemList = [
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png'),
    CategoryItem(id: '1', text: 'Breakfast', image: 'welcomeImg.png')
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
