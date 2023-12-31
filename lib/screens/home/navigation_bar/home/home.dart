import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:provider/provider.dart';
import 'category_list.dart';
import 'popular_list.dart';
import 'package:lefrigo/models/recipe_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const HeaderSection(),
          const SizedBox(height: 25),
          SearchBar(),
          const SizedBox(height: 30),
          const SectionTitle(title: 'Popular now'),
          const SizedBox(height: 20),
          // pass list of popular recipes here
          Consumer<RecipeProvider>(
            builder: (context, recipeProvider, child) {
              if (recipeProvider.isLoading == true) {
                return const CircularProgressIndicator(); // Display a loading indicator
              } else {
                final popularRecipes = recipeProvider.popularRecipes;

                if (popularRecipes.isEmpty) {
                  return const SizedBox(
                    height: 5,
                  );
                }
                return RecipeList(
                    itemIdList:
                        popularRecipes); // Display the list of popular recipes
              }
            },
          ),
          const SizedBox(height: 30),
          SectionTitle(
            title: 'Discover more categories',
            onTap: () {
              context.router.push(const CategoryRoute());
            },
          ),
          const SizedBox(height: 10),
          Consumer<RecipeProvider>(builder: (context, recipeProvider, child) {
            if (recipeProvider.isLoading == true) {
              return const SizedBox(height: 15);
            } else {
              final categories = recipeProvider.categories;
              if (categories.isEmpty) {
                return const SizedBox(
                  height: 5,
                );
              }
              return CategoryList(
                categories: categories,
              );
            }
          }),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 344,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: HeaderText(),
          ),
          // NotificationIcon(),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTextItem(text: 'Bring the'),
        HeaderTextItem(text: 'restaurant'),
        HeaderTextItem(text: 'to your home'),
      ],
    );
  }
}

class HeaderTextItem extends StatelessWidget {
  final String text;

  const HeaderTextItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kaiseiOpti(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF202A44),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: Colors.black.withOpacity(0.5),
            size: 30,
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  List<RecipeSearch> recipeSearch = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 5),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<RecipeProvider>(context, listen: false)
                  .getListofRecipeSearch(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  recipeSearch = snapshot.data as List<RecipeSearch>;
                  return Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return recipeSearch
                        .where((recipe) => recipe.name.toLowerCase().contains(
                              textEditingValue.text.toLowerCase(),
                            ))
                        .map((recipe) => recipe.name)
                        .toList();
                  }, onSelected: (String selectedRecipeName) {
                    setState(() {
                      _searchController.text = selectedRecipeName;
                    });
                  }, fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      onSubmitted: (String value) {
                        onFieldSubmitted();
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Recipes',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                    );
                  });
                } else {
                  return SizedBox(
                    height: 5,
                  );
                }
              }),
            ),
            // child: TextField(
            //   controller: _searchController,
            //   decoration: InputDecoration(
            //     hintText: 'Search Recipes',
            //     hintStyle: GoogleFonts.poppins(
            //       textStyle: const TextStyle(fontSize: 14),
            //     ),
            //     border: InputBorder.none,
            //   ),
            // ),
          ),
          GestureDetector(
            onTap: () {
              String selectedRecipeName = _searchController.text;
              // Find the selected recipe ID based on the selected recipe name.
              RecipeSearch? selectedRecipe = recipeSearch.firstWhere(
                (recipe) => recipe.name == selectedRecipeName,
                orElse: () => throw UnimplementedError(),
              );
              context.router.push(RecipeRoute(recipeid: selectedRecipe.id));
            },
            child: Icon(
              Icons.search,
              size: 24,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SectionTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              textStyle:
                  const TextStyle(fontSize: 15, color: Color(0xFF173F4E)),
            ),
          ),
        ),
        if (onTap != null) ...[
          InkWell(
            onTap: onTap,
            child: const Text(
              'See all',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFE25E3E),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ],
    );
  }
}
