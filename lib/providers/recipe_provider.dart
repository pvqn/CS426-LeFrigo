import 'package:flutter/foundation.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/services/get_it.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeService _service;

  RecipeProvider() : _service = getIt<RecipeService>();

  final _recipeCache = <String, List<String>>{};

  List<String> get categories => _recipeCache.keys.toList();

  List<String> recipesByCategory(String category) =>
      _recipeCache[category]?.toList() ?? [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> refreshCategory() async {
    _isLoading = true;
    notifyListeners();

    try {
      final categories = await _service.getListOfCategories();

      _recipeCache.clear();
      for (final category in categories) {
        _recipeCache[category] = [];
      }

      print('Fetched Categories: $categories');

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('Error fetching categories: $error');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshListOfRecipe(String category) async {
    _isLoading = true;
    notifyListeners();

    final recipes =
        await _service.getListOfRecipesByCategory(category: category);

    _recipeCache.remove(category);

    _recipeCache[category] = recipes;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> likeRecipe(String recipeId) async {
    await _service.likeRecipe(recipeId: recipeId);
  }

  Future<void> refreshListOfLikedRecipes() async {
    _isLoading = true;
    notifyListeners();

    // final recipes = await _service.getListOfLikedRecipes();

    throw UnimplementedError();

    // _recipeCache.remove('Liked');

    // _recipeCache['Liked'] = recipes;

    // _isLoading = false;
    // notifyListeners();
  }

  Future<Recipe> refreshRecipeById(String recipeId) async {
    final recipe = await _service.getRecipeById(id: recipeId);

    return recipe;
  }
}
