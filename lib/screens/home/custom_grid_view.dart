import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:provider/provider.dart';

class dummy {
  String image = 'assets/images/food.png';
  String name = 'antihcmus';
  String nameRecipe = 'Greek Yogurt with Chia Pudding';
  String avatar = 'assets/images/welcome_bg.png';
  int likes = 2000;
}

class MyGridView extends StatelessWidget {
  final List<String> items_id;
  MyGridView({required this.items_id});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 158 / 222,

        crossAxisCount: 2, // Number of columns in the grid
        // Spacing between rows
        // Spacing between columns
      ),
      itemCount: items_id.length, // Use the length of your dynamic list
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            context.router.push(RecipeRoute());
          },
          child: GridItem(item: items_id[index]),
        );
      },
    );
  }
}

class GridItem extends StatelessWidget {
  final String item;

  GridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    return FutureBuilder<Recipe>(
        future: recipeProvider.refreshRecipeById(item),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.all(10),
              width: 158,
              height: 280, // Set a fixed height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black
                        .withOpacity(0.5), // Adjust opacity to control darkness
                    BlendMode.darken,
                  ),
                  image: snapshot.data!.imageId != null
                      ? NetworkImage(
                              'http://52.195.170.49:8888/asset/${snapshot.data!.imageId}')
                          as ImageProvider
                      : const AssetImage('assets/images/food.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(bottom: 130),
                      width: double.infinity, // Expand to full width
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Text('')),
                          const Icon(
                            Icons.favorite,
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(snapshot.data!.numLiked.toString(),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    )),
                    Container(
                      // Wrap text with a Container
                      width: double.infinity, // Expand to full width
                      child: Text(snapshot.data!.name,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      // Wrap text with a Container
                      width: double.infinity, // Expand to full width
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage('assets/images/welcome_bg.png'),
                          ),
                          const SizedBox(width: 5),
                          Text('antihcmus',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              width: 158,
              height: 280, // Set a fixed height
              child: const CircularProgressIndicator(),
            );
          }
        });

    // return Container(
    //   margin: EdgeInsets.all(10),
    //   width: 158,
    //   height: 280, // Set a fixed height
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //     image: DecorationImage(
    //       image: item.imageId != null
    //           ? NetworkImage('http://52.195.170.49:8888/asset/${item.imageId}')
    //               as ImageProvider
    //           : const AssetImage('assets/images/food.png'),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 margin: EdgeInsets.only(bottom: 140),
    //                 width: double.infinity, // Expand to full width
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     Expanded(child: Text('')),
    //                     Icon(
    //                       Icons.favorite,
    //                       size: 20,
    //                       color: Colors.white,
    //                     ),
    //                     SizedBox(
    //                       width: 5,
    //                     ),
    //                     Text(item.numLiked.toString(),
    //                         style: GoogleFonts.poppins(
    //                             textStyle: TextStyle(
    //                                 fontSize: 13,
    //                                 color: Colors.white,
    //                                 fontWeight: FontWeight.bold))),
    //                     SizedBox(
    //                       width: 8,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 // Wrap text with a Container
    //                 width: double.infinity, // Expand to full width
    //                 child: Text(snapshot ?? 'Greek Yogurt with Chia Pudding',
    //                     style: GoogleFonts.inter(
    //                         textStyle: TextStyle(
    //                             fontSize: 15,
    //                             color: Colors.white,
    //                             fontWeight: FontWeight.bold))),
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //               Container(
    //                 // Wrap text with a Container
    //                 width: double.infinity, // Expand to full width
    //                 child: Row(
    //                   children: [
    //                     CircleAvatar(
    //                       radius: 10,
    //                       backgroundImage:
    //                           AssetImage('assets/images/welcome_bg.png'),
    //                     ),
    //                     SizedBox(width: 5),
    //                     Text(item.author ?? 'antihcmus',
    //                         style: GoogleFonts.poppins(
    //                             textStyle: TextStyle(
    //                                 fontSize: 13,
    //                                 color: Colors.white,
    //                                 fontWeight: FontWeight.w500))),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //             ],
    //           ),
    //         ),
    // );
  }
}
