import 'package:flutter/foundation.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/services/get_it.dart';

enum RecipeProviderState {
  initial,
  loading,
  fetchCategoriesSuccess,
  fetchCategoriesFailure,
  fetchRecipesListSuccess,
  fetchRecipesListFailure,
  likeRecipeSuccess,
  likeRecipeFailure,
  fetchPopularRecipesSuccess,
  fetchPopularRecipesFailure,
  fetchLikedRecipesSuccess,
  fetchLikedRecipesFailure,
}

class RecipeProviderStateNotifier extends ChangeNotifier {
  RecipeProviderState _state = RecipeProviderState.initial;

  RecipeProviderState get state => _state;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void setState(RecipeProviderState state, [String? errorMessage]) {
    _state = state;
    _errorMessage = errorMessage;
  }

  void setLoading() {
    _state = RecipeProviderState.loading;
  }
}

class RecipeProvider extends ChangeNotifier {
  final RecipeService _service;
  final Logger _logging;

  RecipeProvider()
      : _service = getIt<RecipeService>(),
        _logging = getIt<Logger>(param1: 'RecipeProvider');

  final _recipeCache = <String, dynamic>{};

  List<String> get categories => _recipeCache.keys.toList();

  String imageIdsOfCategory(String category) =>
      _recipeCache[category]['imageId'] ?? "";

  List<String> recipesByCategory(String category) =>
      (_recipeCache[category]['recipes'] as List<String>?)?.toList() ?? [];

  final _stateNotifier = RecipeProviderStateNotifier();

  RecipeProviderStateNotifier get stateNotifier => _stateNotifier;

  bool get isLoading =>
      _stateNotifier.state == RecipeProviderState.loading ||
      _stateNotifier.state == RecipeProviderState.initial;

  Future<void> refreshListOfCategories() async {
    _stateNotifier.setLoading();
    notifyListeners();

    try {
      final categories = await _service.getListOfCategories();

      _recipeCache.clear();

      for (final category in categories) {
        _recipeCache[category.name] = {};
        _recipeCache[category.name]['imageId'] = category.image;
      }

      _logging.info('Fetched Categories: $categories');

      _stateNotifier.setState(RecipeProviderState.fetchCategoriesSuccess);
      notifyListeners();
    } catch (error) {
      _logging.warning('Error fetching categories: $error');
      _stateNotifier.setState(
        RecipeProviderState.fetchCategoriesFailure,
        error.toString(),
      );
      notifyListeners();
    }
  }

  // Future<void> refreshListOfCategories() async {
  //   _stateNotifier.resetState();

  //   try {
  //     final categories = await _service.getListOfCategories();

  //     _recipeCache.clear();
  //     for (final category in categories) {
  //       _recipeCache[category.] = [];
  //     }

  //     _logging.info('Fetched Categories: $categories');

  //     _stateNotifier.setState(RecipeProviderState.fetchCategoriesSuccess);
  //   } catch (error) {
  //     _logging.warning('Error fetching categories: $error');
  //     _stateNotifier.setState(
  //       RecipeProviderState.fetchCategoriesFailure,
  //       error.toString(),
  //     );
  //   }
  // }

  // @Deprecated('Use refreshListOfCategories instead')
  // Future<void> refreshCategory() async {
  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     final categories = await _service.getListOfCategories();

  //     _recipeCache.clear();
  //     for (final category in categories) {
  //       _recipeCache[category] = [];
  //     }

  //     _logging.info('Fetched Categories: $categories');

  //     _isLoading = false;
  //     notifyListeners();
  //   } catch (error) {
  //     _logging.warning('Error fetching categories: $error');
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  List<String> _popularRecipesId = [];
  List<String> get popularRecipes => _popularRecipesId;

  Future<void> refreshListOfRecipesByCategory(
      {required String category}) async {
    _stateNotifier.setLoading();
    notifyListeners();

    try {
      final recipes =
          await _service.getListOfRecipesByCategory(category: category);

      _popularRecipesId = recipes;

      _logging.info('Fetched Recipes: $recipes');

      _stateNotifier.setState(RecipeProviderState.fetchRecipesListSuccess);
    } catch (error) {
      _logging.warning('Error fetching recipes: $error');
      _stateNotifier.setState(
        RecipeProviderState.fetchRecipesListFailure,
        error.toString(),
      );
      notifyListeners();
    }
  }

  // Future<void> refreshListOfRecipesByCategory(
  //     {required String category}) async {
  //   _stateNotifier.resetState();

  //   try {
  //     final recipes =
  //         await _service.getListOfRecipesByCategory(category: category);

  //     _recipeCache[category] = recipes;

  //     _logging.info('Fetched Recipes: $recipes');

  //     _stateNotifier.setState(RecipeProviderState.fetchRecipesListSuccess);
  //   } catch (error) {
  //     _logging.warning('Error fetching recipes: $error');
  //     _stateNotifier.setState(
  //       RecipeProviderState.fetchRecipesListFailure,
  //       error.toString(),
  //     );
  //   }
  // }

  // @Deprecated('Use refreshListOfRecipesByCategory instead')
  // Future<void> refreshListOfRecipe(String category) async {
  //   _isLoading = true;
  //   notifyListeners();

  //   final recipes =
  //       await _service.getListOfRecipesByCategory(category: category);

  //   _recipeCache.remove(category);

  //   _recipeCache[category] = recipes;

  //   _isLoading = false;
  //   notifyListeners();
  // }

  Future<void> likeAndRefreshRecipe(String recipeId, bool isLike) async {
    try {
      if (isLike) {
        await _service.likeRecipe(recipeId: recipeId);
      } else {
        await _service.unlikeRecipe(recipeId: recipeId);
      }

      _logging.info('Liked recipe: $recipeId');
      _stateNotifier.setState(RecipeProviderState.likeRecipeSuccess);
      notifyListeners();
    } catch (error) {
      _logging.warning('Error liking recipe: $error');
      _stateNotifier.setState(
        RecipeProviderState.likeRecipeFailure,
        error.toString(),
      );
      notifyListeners();
    }
  }

  // @Deprecated('Use likeAndRefreshRecipe instead')
  // Future<void> likeRecipe(String recipeId) async {
  //   await _service.likeRecipe(recipeId: recipeId);
  // }

  // @Deprecated('Use likeAndRefreshRecipe instead')
  // Future<void> refreshListOfLikedRecipes() async {
  //   _isLoading = true;
  //   notifyListeners();

  //   throw UnimplementedError();
  // }

  Future<Recipe> getRecipeById(String recipeId) async {
    try {
      final recipe = await _service.getRecipeById(id: recipeId);

      _logging.info('Fetched Recipe: $recipe');
      return recipe;
    } catch (error) {
      _logging.warning('Error fetching recipe: $error');
      rethrow;
    }
  }

  Future<List<String>> refreshListOfPopularRecipes() async {
    _stateNotifier.setLoading();

    try {
      final recipes = await _service.getPopularRecipes();

      _popularRecipesId = recipes;

      _logging.info('Fetched Popular Recipes: $recipes');

      _stateNotifier.setState(RecipeProviderState.fetchPopularRecipesSuccess);
      notifyListeners();
      print(recipes);
      return recipes;
    } catch (error) {
      _logging.warning('Error fetching popular recipes: $error');
      _stateNotifier.setState(
        RecipeProviderState.fetchPopularRecipesFailure,
        error.toString(),
      );
      notifyListeners();
      rethrow;
    }
  }

  Future<List<String>> suggestRecipes(
      {required List<String> ingredients}) async {
    try {
      final recipes = await _service.suggestRecipe(ingredients: ingredients);

      _logging.info('Suggested Recipes: $recipes');
      return recipes;
    } catch (error) {
      _logging.warning('Error suggesting recipes: $error');
      rethrow;
    }
  }
}
