import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/services/get_it.dart';
import 'package:provider/provider.dart';

class MyGridView extends StatefulWidget {
  final List<String> itemIdList;
  const MyGridView({super.key, required this.itemIdList});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 158 / 222,

        crossAxisCount: 2, // Number of columns in the grid
        // Spacing between rows
        // Spacing between columns
      ),
      itemCount:
          widget.itemIdList.length, // Use the length of your dynamic list
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            context.router
                .push(RecipeRoute(recipeid: widget.itemIdList[index]));
          },
          child: GridItem(item: widget.itemIdList[index]),
        );
      },
    );
  }
}

class GridItem extends StatefulWidget {
  final String item;

  const GridItem({super.key, required this.item});

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  ImageProvider<Object> _image = const AssetImage('assets/images/food.png');
  bool _tryToFetchImage = false;

  late Future<Recipe> _getRecipe;

  @override
  void initState() {
    super.initState();
    _getRecipe = Provider.of<RecipeProvider>(context, listen: false)
        .getRecipeById(widget.item);
  }

  Future<void> _loadImage(String imageId) async {
    final apiService = getIt.get<ApiService>();

    try {
      final image = await apiService.fetchImageFromId(id: imageId);

      if (image.type == ApiResponseType.success) {
        if (mounted) {
          setState(() {
          String rawData = image.message!;

          List<int> bytes = rawData.codeUnits;

          if (mounted) _image = Image.memory(Uint8List.fromList(bytes)).image;
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

    return FutureBuilder<Recipe>(
        future: recipeProvider.getRecipeById(widget.item),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (!_tryToFetchImage) {
              _tryToFetchImage = true;
              if (snapshot.data!.imageId != null) {
                _loadImage(snapshot.data!.imageId!);
              }
            }

            return Container(
              margin: const EdgeInsets.all(10),
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
                  image: _image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(bottom: 130),
                      width: double.infinity, // Expand to full width
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(child: Text('')),
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
                    SizedBox(
                      // Wrap text with a Container
                      width: double.infinity, // Expand to full width
                      child: Text(snapshot.data!.name,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800))),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
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
            return const SizedBox(
              width: 158,
              height: 280, // Set a fixed height
              child: Center(
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(),
                ),
              ),
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
