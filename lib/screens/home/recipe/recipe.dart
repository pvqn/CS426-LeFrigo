import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'summary_tab.dart';
import 'model.dart';
import 'directions_tab.dart';
import 'ingredient_tab.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  final dummy recipe = dummy();

  RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              RecipeHeader(recipe: recipe),
              const RecipeTabsContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeHeader extends StatelessWidget {
  final dummy recipe;

  const RecipeHeader({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: Container(
            child: Image.asset(
              'assets/images/food.png',
              fit: BoxFit.cover,
              height: 280,
              width: double.infinity,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(child: Text('')),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite_outline,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 170),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeInfo('Prep Time:', recipe.prepTime),
                    _buildTimeInfo('Cook Time:', recipe.cookTime),
                    _buildTimeInfo('Ref Time:', recipe.refTime),
                    _buildTimeInfo('Total Time:', recipe.totalTime),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class RecipeTabsContent extends StatelessWidget {
  const RecipeTabsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: TabBar(
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.black,
              labelStyle: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              tabs: const [
                Tab(text: 'Summary'),
                Tab(text: 'Ingredients'),
                Tab(text: 'Directions'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SummaryTab(),
                const IngredientsTab(),
                const DirectionsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
