import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post_grid_item.dart';
import 'model.dart';

class PostGridView extends StatelessWidget {
  final List<dummy> items;
  final ValueChanged<int> onRemove;

  PostGridView({required this.items, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 158 / 222,
        crossAxisCount: 2, // Number of columns in the grid
      ),
      itemCount: items.length, // Use the length of your dynamic list
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // context.router.push(RecipeRoute());
          },
          child: PostGridItem(
            item: items[index],
            onRemove: () {
              onRemove(index);
            },
          ),
        );
      },
    );
  }
}
