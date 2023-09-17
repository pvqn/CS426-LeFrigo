import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/screens/home/custom_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:lefrigo/providers/recipe_provider.dart';

@RoutePage()
class SelectCategoryScreen extends StatelessWidget {
  final String category;

  const SelectCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SelectCategory(
      category: category,
    );
  }
}

class SelectCategory extends StatefulWidget {
  final String category;
  const SelectCategory({super.key, required this.category});

  @override
  SelectCategoryState createState() => SelectCategoryState();
}

class SelectCategoryState extends State<SelectCategory> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<RecipeProvider>(context, listen: false)
          .refreshListOfRecipe(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
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
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.category,
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                  final recipes =
                      recipeProvider.recipesByCategory(widget.category);

                  return MyGridView(
                    itemIdList: recipes,
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
