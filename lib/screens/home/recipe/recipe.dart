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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              RecipeHeader(recipe: recipe),
              RecipeTabsContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeHeader extends StatelessWidget {
  final dummy recipe;

  RecipeHeader({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
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
            padding: EdgeInsets.only(
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
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: Text('')),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite_outline,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 170),
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
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: TabBar(
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.black,
              labelStyle: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              tabs: [
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
                IngredientsTab(),
                DirectionsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
