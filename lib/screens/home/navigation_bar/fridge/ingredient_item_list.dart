import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'ingredient_item.dart';

class IngredientListView extends StatefulWidget {
  final List<String> itemList;

  IngredientListView({required this.itemList});

  @override
  IngredientListViewState createState() => IngredientListViewState();
}

class IngredientListViewState extends State<IngredientListView> {
  final TextEditingController _ingredientController = TextEditingController();
  late final List<String> itemList = widget.itemList;

  // Create a list of ingredient names for Autocomplete
  List<String> ingredientNames = [
    'Onions',
    'Flour',
    'Sugar',
    'Salt',
    // Add more ingredient names here
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 363.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0), // Rounded corners
              border: Border.all(
                color: Colors.grey.withOpacity(0.5), // Border color
                width: 2.0, // Border width
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: const Offset(0, 2), // Offset from the top
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: FutureBuilder(
                      future:
                          Provider.of<RecipeProvider>(context, listen: false)
                              .getListOfIngredients(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final ingredientList = snapshot.data as List<String>;
                          print(ingredientList);
                          return Autocomplete<String>(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<String>.empty();
                              }
                              return ingredientList.where((String ingredient) {
                                return ingredient.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (String ingredient) {
                              setState(() {
                                _ingredientController.text = ingredient;
                              });
                            },
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                    fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return TextField(
                                controller: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                                onSubmitted: (String value) {
                                  onFieldSubmitted();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Add Ingredient',
                                  hintStyle: GoogleFonts.poppins(fontSize: 14),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(16.0),
                                ),
                              );
                            },
                          );
                        } else {
                          return SizedBox(
                            height: 5,
                          );
                        }
                      }),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color(0xFFE25E3E),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    String newItem = _ingredientController.text;
                    if (newItem.isNotEmpty) {
                      setState(() {
                        itemList.add(newItem);
                        _ingredientController.clear();
                      });
                    }
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Color(0xFFE25E3E),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
          const SizedBox(height: 35),
          Container(
            width: 363.0,
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              'Current Ingredients',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            width: 363.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return IngredientItem(
                  text: itemList[index],
                  onRemove: () {
                    setState(() {
                      itemList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
