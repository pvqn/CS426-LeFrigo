import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/recipe_provider.dart';
import 'package:lefrigo/providers/user_provider.dart';
import 'package:lefrigo/services/api_service.dart';
import 'package:lefrigo/services/get_it.dart';
import 'package:provider/provider.dart';
import 'summary_tab.dart';
import 'directions_tab.dart';
import 'ingredient_tab.dart';
import 'package:lefrigo/models/recipe.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  final String recipeid;

  const RecipeScreen({super.key, required this.recipeid});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: FutureBuilder<Recipe>(
          future: recipeProvider.getRecipeById(recipeid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  RecipeHeader(
                      recipe:
                          snapshot.data != null ? snapshot.data! : dummyRecipe),
                  RecipeTabsContent(
                      recipe:
                          snapshot.data != null ? snapshot.data! : dummyRecipe),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class RecipeHeader extends StatefulWidget {
  final Recipe recipe;

  const RecipeHeader({super.key, required this.recipe});

  @override
  State<RecipeHeader> createState() => _RecipeHeaderState();
}

class _RecipeHeaderState extends State<RecipeHeader> {
  ImageProvider<Object> _image =
      const AssetImage('assets/images/food.png');

  @override
  void initState() {
    super.initState();
    if (widget.recipe.imageId != null) {
      _loadImage(widget.recipe.imageId!);
    }
  }

  Future<void> _loadImage(String imageId) async {
    final apiService = getIt.get<ApiService>();

    try {
      final image = await apiService.fetchImageFromId(id: imageId);

      if (image.type == ApiResponseType.success) {
        if (mounted) {
          setState(() {
          String rawData = image.message!;
          // To UInt8List
          List<int> bytes = rawData.codeUnits;
          // To Image
          _image = Image.memory(Uint8List.fromList(bytes)).image;
        });
        }
      }
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    final userProvider = Provider.of<UserProvider>(context);

    bool isLiked = userProvider.user.likes.contains(widget.recipe.id);
    print(isLiked);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black
                      .withOpacity(0.5), // Adjust opacity to control darkness
                  BlendMode.darken,
                ),
                image: _image,
                fit: BoxFit.cover,
              ),
            ),
            height: 280,
            width: double.infinity,
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
                      onTap: () => recipeProvider.likeAndRefreshRecipe(
                        widget.recipe.id!,
                        !isLiked,
                      ).then((_) => userProvider.refreshUser()),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
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
                    _buildTimeInfo(
                        'Prep Time:', '${widget.recipe.details.prepTime} min'),
                    _buildTimeInfo(
                        'Cook Time:', '${widget.recipe.details.cookTime} min'),
                    _buildTimeInfo(
                        'Total Time:', '${widget.recipe.details.totalTime} min'),
                    _buildTimeInfo('Servings:', '${widget.recipe.details.servings}'),
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
  final Recipe recipe;

  const RecipeTabsContent({super.key, required this.recipe});

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
                SummaryTab(recipe: recipe),
                IngredientsTab(recipe: recipe),
                DirectionsTab(recipe: recipe),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final dummyRecipe = Recipe(
  id: '1',
  author: 'John Doe',
  numLiked: 42,
  name: 'Delicious Pasta',
  description: 'A mouth-watering pasta recipe',
  category: 'Italian',
  details: Details(
    cookTime: 30,
    prepTime: 15,
    servings: 4,
    totalTime: 45,
  ),
  nutrition: Nutrition(
    calories: '350',
    carbs: '45g',
    fat: '12g',
    protein: '18g',
  ),
  ingredients: [
    Ingredients(name: 'Pasta', quantity: '200g', unit: 'grams'),
    Ingredients(name: 'Tomatoes', quantity: '4', unit: 'pieces'),
    Ingredients(name: 'Olive Oil', quantity: '2 tbsp'),
    Ingredients(name: 'Salt', quantity: '1 tsp'),
  ],
  directions: [
    'Boil the pasta in a large pot of salted water until al dente.',
    'Meanwhile, heat olive oil in a pan and sauté tomatoes until soft.',
    'Drain pasta and toss with sautéed tomatoes.',
    'Serve hot and enjoy!',
  ],
  imageId: '12345',
  image: 'https://example.com/recipe-image.jpg',
);
