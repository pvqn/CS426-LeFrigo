import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'category_item_list.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:lefrigo/providers/recipe_provider.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryPage();
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<CategoryPage> {
  static const Color customColor = Color(0xFFE25E3E);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<RecipeProvider>(context, listen: false).refreshCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the start (left)
              children: [
                InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Consumer<RecipeProvider>(
              builder: (context, recipeProvider, child) {
                if (recipeProvider.isLoading) {
                  return const CircularProgressIndicator(); // Show loading indicator
                } else {
                  // print('ok');

                  final categories = recipeProvider.categories;
                  return CategoryListView(categories: categories);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
