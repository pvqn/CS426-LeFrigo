import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/services/get_it.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class PostGridItem extends StatelessWidget {
  final String item;
  final VoidCallback onRemove;

  const PostGridItem({super.key, required this.item, required this.onRemove});
  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Set the border radius here
          ),
          content: SizedBox(
            width: 337, // Set the desired width
            // Set the desired height
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use min to limit height
              children: [
                Text(
                  'Are you sure?',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0), // Add vertical space
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Set the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        onRemove(); // Notify parent that removal is confirmed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Set the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //context.router.push(RecipeRoute());
      },
      child: FutureBuilder(
          future: Provider.of<RecipeProvider>(context).getRecipeById(item),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              margin: const EdgeInsets.all(10),
              width: 158,
              height: 280, // Set a fixed height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: snapshot.data?.imageId == null
                      ? const AssetImage('assets/images/food.jpg')
                      : NetworkImage(getIt<ApiService>().getImageFromId(
                          id: snapshot.data!.imageId!)) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showRemoveDialog(context);
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 20,
                              color: Color(0xFFFF0B0B),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Expanded(child: Text('')),
                    SizedBox(
                      width: double.infinity, // Expand to full width
                      child: Text(snapshot.data!.name,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity, // Expand to full width
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
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
                            width: 8,
                          ),
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
          }),
    );
  }
}
