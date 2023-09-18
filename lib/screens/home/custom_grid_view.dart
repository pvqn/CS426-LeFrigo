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
        crossAxisCount: 2,
      ),
      itemCount: widget.itemIdList.length,
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
        setState(() {
          String rawData = image.message!;

          List<int> bytes = rawData.codeUnits;

          _image = Image.memory(Uint8List.fromList(bytes)).image;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Recipe>(
        future: _getRecipe,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (!_tryToFetchImage && snapshot.data!.imageId != null) {
              _tryToFetchImage = true;
              _loadImage(snapshot.data!.imageId.toString());
            }

            return Container(
              margin: const EdgeInsets.all(10),
              width: 158,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
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
                      width: double.infinity,
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
                      width: double.infinity,
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
                      width: double.infinity,
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
              height: 280,
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
  }
}
