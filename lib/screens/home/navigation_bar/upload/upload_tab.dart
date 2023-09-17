import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'summary_tab/summary_tab.dart';
import 'ingredient_tab/ingredient_tab.dart';
import 'directions_tab/directions_tab.dart';
import 'dart:io' show File;
import 'ingredient_tab/model.dart';
import 'directions_tab/model.dart';

@RoutePage()
class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? selectedImage;
  List<ingredient> itemListIng = [];
  List<Direction> itemListDir = [];

  TextEditingController recipeName = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController totalTime = TextEditingController();

  TextEditingController serving = TextEditingController();

  TextEditingController prepTime = TextEditingController();

  TextEditingController cookTime = TextEditingController();

  TextEditingController cal = TextEditingController();

  TextEditingController fat = TextEditingController();

  TextEditingController carb = TextEditingController();

  TextEditingController protein = TextEditingController();

  String selectedCategory = 'Dinner Recipes';
  @override
  void dispose() {
    recipeName.dispose();
    description.dispose();
    totalTime.dispose();
    serving.dispose();
    prepTime.dispose();
    cookTime.dispose();
    cal.dispose();
    fat.dispose();
    carb.dispose();
    protein.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              UploadHeader(),
              Expanded(
                child: TabBarView(
                  children: [
                    SummaryTab(
                      recipeName: recipeName,
                      description: description,
                      totalTime: totalTime,
                      cookTime: cookTime,
                      fat: fat,
                      carb: carb,
                      protein: protein,
                      cal: cal,
                      selectedCategory: selectedCategory,
                      serving: serving,
                      selectedImage: selectedImage,
                      prepTime: prepTime,
                    ),
                    IngredientTab(
                      itemList: itemListIng,
                    ),
                    DirectionsTab(
                      itemList: itemListDir,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadHeader extends StatelessWidget {
  const UploadHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: GestureDetector(
              onTap: () {
                context.router.pop();
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFE25E3E))),
              )),
        ),
        const UploadTabsContent(),
      ],
    );
  }
}

class UploadTabsContent extends StatelessWidget {
  const UploadTabsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          child: TabBar(
            labelColor: const Color(0xFFE25E3E),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            tabs: const [
              Tab(text: '1'),
              Tab(text: '2'),
              Tab(text: '3'),
            ],
          ),
        ),
      ],
    );
  }
}

class Third1Screen extends StatelessWidget {
  const Third1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
