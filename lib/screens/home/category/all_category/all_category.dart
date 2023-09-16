import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'category_item_list.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryPage();
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
