import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lefrigo/routes/routes.dart';
import 'category_item.dart';

class CategoryListView extends StatefulWidget {
  final List<String> categories; // Add a parameter to accept categories

  const CategoryListView({super.key, required this.categories}); // Constructor
  @override
  CategoryListViewState createState() => CategoryListViewState();
}

class CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: CategoryItem(
                  text: widget.categories[index],
                ),
                onTap: () {
                  context.router.push(
                      SelectCategoryRoute(category: widget.categories[index]));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
