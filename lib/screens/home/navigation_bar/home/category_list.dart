import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/services/get_it.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  final List<String> categories;
  const CategoryList({super.key, required this.categories}); // Constructor

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.router.push(
                  SelectCategoryRoute(category: widget.categories[index]));
            },
            child: CategoryItem(
              text: widget.categories[index],
              id: recipeProvider.imageIdsOfCategory(widget.categories[index]),
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String text;
  final String id;

  const CategoryItem({
    super.key,
    required this.text,
    this.id = '',
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  ImageProvider<Object> _image = const AssetImage('assets/images/food.png');

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final apiService = getIt.get<ApiService>();

    try {
      final image = await apiService.fetchImageFromId(id: widget.id);

      if (image.type == ApiResponseType.success) {
        setState(() {
          String rawData = image.message!;
          // To UInt8List
          List<int> bytes = rawData.codeUnits;
          // To Image
          _image = Image.memory(Uint8List.fromList(bytes)).image;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 15),
      width: 280,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          // Background Image loaded from API
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: _image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Positioned(
            left: 5,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      widget.text,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class CategoryItem {
//   String image = 'assets/images/welcome_bg.png';
//   String name = "Breakfast and Brunch";
// }


// class CategoryItemWidget extends StatelessWidget {
//   final CategoryItem item;

//   const CategoryItemWidget({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 30, left: 15),
//       width: 280,
//       height: 100,
//       decoration: const BoxDecoration(),
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               image: DecorationImage(
//                 image: AssetImage(item.image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 5,
//             bottom: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 180,
//                     child: Text(
//                       item.name,
//                       style: GoogleFonts.inter(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
