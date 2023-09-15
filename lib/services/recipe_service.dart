import 'package:fpdart/fpdart.dart';
import 'package:lefrigo/models/categories.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/services/dio_service.dart';

class RecipeServices {
  final DioService _dioService;

  RecipeServices({required DioService dioService}) : _dioService = dioService;

  Future<Either<List<Categories>, String>> getCategories() async {
    final response = await _dioService.dio.get(ApiEndPoints.categories);

    if (response.statusCode == 200) {
      final categories = response.data as List<dynamic>;
      final categoriesList = categories
          .map((e) => Categories.fromJson(e))
          .where((element) => element.recipes.isNotEmpty)
          .toList();
      return left(categoriesList);
    } else {
      return right('Error');
    }
  }

  Future<Either<Recipe, String>> getRecipe(String id) async {
    final response = await _dioService.dio.get(ApiEndPoints.recipeById(id));

    if (response.statusCode == 200) {
      final recipe = Recipe.fromJson(response.data);
      return left(recipe);
    } else {
      return right('Error');
    }
  }
}
