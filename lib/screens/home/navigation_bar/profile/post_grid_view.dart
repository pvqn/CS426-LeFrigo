import 'package:flutter/material.dart';
import 'package:lefrigo/models/recipe.dart';
import 'post_grid_item.dart';

class PostGridView extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int> onRemove;

  const PostGridView({
    super.key,
    required this.items,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
