import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/screens/home/custom_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:lefrigo/providers/recipe_provider.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  final String text;
  final List<String> ingredients;
  const ResultScreen(
      {super.key, required this.text, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Result(
      text: text,
      ingredients: ingredients,
    );
  }
}

class Result extends StatefulWidget {
  final String text;
  final List<String> ingredients;

  const Result({super.key, required this.text, required this.ingredients});

  @override
  ResultState createState() => ResultState();
}

class ResultState extends State<Result> {
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
                  widget.text,
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
            child: FutureBuilder(
              future: Provider.of<RecipeProvider>(context, listen: false)
                  .suggestRecipes(ingredients: widget.ingredients),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final recipes = snapshot.data as List<String>;
                    return MyGridView(
                      itemIdList: recipes,
                    );
                  } else {
                    return const Text('No data');
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
