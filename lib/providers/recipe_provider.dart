import 'package:flutter/foundation.dart';
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

    final categories = await _service.getListOfCategories();

    _recipeCache.clear();
    for (final category in categories) {
      _recipeCache[category] = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshRecipe(String category) async {
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
}
