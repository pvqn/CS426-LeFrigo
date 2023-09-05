import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dummy {
  String prepTime = '10 min';
  String cookTime = '10 min';
  String refTime = '10 min';
  String totalTime = '10 min';
  String nameRecipe = 'Greek Yogurt Chia pudding';
  String image = 'assets/welcomeImg.png';
  int likes = 2000;
  String nameUser = 'antihcmus';
  String description =
      'I have a strong aversion to HCMUS. I hold a deep-seated dislike for HCMUS. I harbor a strong aversion towards HCMUS and find it to be quite displeasing';
  int serving = 2;
  double cal = 10;
  double fat = 7;
  double carb = 33;
  double protein = 33;
  List<ingredient> ingredients = [ingredient(), ingredient()];
  List<String> directions = ['antihcmus', 'antihcmus'];
}

class ingredient {
  String name = 'greek yogurt';
  String note = 'anti hcmus';
  String quantity = '5.3 ounce';
}

class RecipePage extends StatelessWidget {
  final dummy recipe = dummy();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Three tabs: Summary, Ingredients, and Directions
        child: Scaffold(
          body: Column(
            children: [
              _buildHeader(context), // Back icon and image
              _buildTabsContent(), // Tabs content
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
            bottomRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
          child: Container(
            child: Image.asset(
              'assets/food.png', // Replace with your image asset path
              fit: BoxFit.cover,
              height: 280,
              width: double.infinity,
              // Adjust the height as needed
            ),
          ),
        ),
        Align(
          alignment:
              Alignment.topLeft, // Align the icons to the top-left corner
          child: Padding(
              padding: EdgeInsets.only(
                  top: 40, left: 20, right: 20), // Add some padding if needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 170,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Prep Time:',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13)),
                            ),
                            Text(
                              recipe.prepTime,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Cook Time:',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13)),
                            ),
                            Text(
                              recipe.cookTime,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Ref Time:',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13)),
                            ),
                            Text(
                              recipe.refTime,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Total Time:',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13)),
                            ),
                            Text(
                              recipe.totalTime,
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildTabsContent() {
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
                      color: Colors.black)),
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

class SummaryTab extends StatelessWidget {
  final dummy recipe = dummy();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 365,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(recipe.nameRecipe,
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/welcomeImg.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  recipe.nameUser,
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                )),
                Icon(Icons.favorite, color: Colors.black, size: 24),
                SizedBox(
                  width: 5,
                ),
                Text(
                  recipe.likes.toString(),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(recipe.description,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 13, color: Colors.black))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Servings: ',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  recipe.serving.toString(),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 15, color: Colors.black)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('Nutrition facts',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Calories',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.cal.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Fat',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.fat.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Carbs',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.carb.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Protein',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.protein.toString() + 'g',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class IngredientsTab extends StatefulWidget {
  @override
  _IngredientsTabState createState() => _IngredientsTabState();
}

class _IngredientsTabState extends State<IngredientsTab> {
  List<ingredient> ingredients = [
    ingredient(),
    ingredient(),
    ingredient(),
    ingredient(),
    ingredient(),
    ingredient(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          width: 366,
          height: 58,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFE25E3E).withOpacity(0.2), // Border color
              width: 1.0, // Border width
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ingredients[index].name,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Text('Notes: ' + ingredients[index].note,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 14,
                    )))
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                Text(ingredients[index].quantity,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Text(''),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ]),
        );
      },
    );
  }
}

class DirectionsTab extends StatefulWidget {
  @override
  _DirectionsTabState createState() => _DirectionsTabState();
}

class _DirectionsTabState extends State<DirectionsTab> {
  List<String> directions = [
    dummy().description,
    dummy().description,
    dummy().description
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: directions.length,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.all(10),
            width: 366,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Border color
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Step ' + (index + 1).toString(),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(directions[index],
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ))),
                ],
              ),
            ));
      },
    );
  }
}
