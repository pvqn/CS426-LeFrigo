import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/providers/recipe_provider.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/services/get_it.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  final List<String> itemIdList;

  RecipeList({required this.itemIdList});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  late List<String> itemIdList;

  @override
  void initState() {
    super.initState();
    itemIdList = widget.itemIdList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemIdList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                context.router.push(RecipeRoute(recipeid: itemIdList[index]));
              },
              child: RecipeItemWidget(item: itemIdList[index]));
        },
      ),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  final String item;

  const RecipeItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    return FutureBuilder<Recipe>(
      future: recipeProvider.getRecipeById(item),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(left: 15),
            width: 306,
            height: 460,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Adjust opacity to control darkness
                        BlendMode.darken,
                      ),
                      image: snapshot.data!.imageId != null
                          ? NetworkImage(getIt.get<ApiService>().getImageFromId(
                                  id: snapshot.data!.imageId.toString()))
                              as ImageProvider
                          : const AssetImage('assets/images/food.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/welcome_bg.png'),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 13),
                              Text(
                                'antihcmus',
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
                          snapshot.data!.numLiked.toString(),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            snapshot.data!.name,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Cook time: ' +
                              snapshot.data!.details.cookTime.toString() +
                              ' min',
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
        } else {
          return const SizedBox(
            width: 158,
            height: 280, // Set a fixed height
            child: CircularProgressIndicator(),
          );
        }
      },
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
