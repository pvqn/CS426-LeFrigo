import 'package:flutter/foundation.dart';
import 'package:lefrigo/models/recipe.dart';
import 'package:lefrigo/services/get_it.dart';

enum RecipeProviderState {
  unknown,
  fetchCategoriesSuccess,
  fetchCategoriesFailure,
  fetchRecipesListSuccess,
  fetchRecipesListFailure,
  likeRecipeSuccess,
  likeRecipeFailure,
}

class RecipeProviderStateNotifier extends ChangeNotifier {
  RecipeProviderState _state = RecipeProviderState.unknown;

  RecipeProviderState get state => _state;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void setState(RecipeProviderState state, [String? errorMessage]) {
    _state = state;
    _errorMessage = errorMessage;
    notifyListeners();
  }

  void resetState() {
    _state = RecipeProviderState.unknown;
    _errorMessage = null;
    notifyListeners();
  }
}

class RecipeProvider extends ChangeNotifier {
  final RecipeService _service;
  final Logger _logging;

  RecipeProvider()
      : _service = getIt<RecipeService>(),
        _logging = getIt<Logger>(param1: 'RecipeProvider');

  final _recipeCache = <String, List<String>>{};

  List<String> get categories => _recipeCache.keys.toList();

  List<String> recipesByCategory(String category) =>
      _recipeCache[category]?.toList() ?? [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final _stateNotifier = RecipeProviderStateNotifier();

  RecipeProviderStateNotifier get stateNotifier => _stateNotifier;

  Future<void> refreshListOfCategories() async {
    _stateNotifier.resetState();

    try {
      final categories = await _service.getListOfCategories();

      _recipeCache.clear();
      for (final category in categories) {
        _recipeCache[category] = [];
      }

      _logging.info('Fetched Categories: $categories');

      _stateNotifier.setState(RecipeProviderState.fetchCategoriesSuccess);
    } catch (error) {
      _logging.warning('Error fetching categories: $error');
      _stateNotifier.setState(
        RecipeProviderState.fetchCategoriesFailure,
        error.toString(),
      );
    }
  }

  @Deprecated('Use refreshListOfCategories instead')
  Future<void> refreshCategory() async {
    _isLoading = true;
    notifyListeners();

    try {
      final categories = await _service.getListOfCategories();

      _recipeCache.clear();
      for (final category in categories) {
        _recipeCache[category] = [];
      }

      _logging.info('Fetched Categories: $categories');

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _logging.warning('Error fetching categories: $error');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshListOfRecipesByCategory(
      {required String category}) async {
    _stateNotifier.resetState();

    try {
      final recipes =
          await _service.getListOfRecipesByCategory(category: category);

      _recipeCache[category] = recipes;

      _logging.info('Fetched Recipes: $recipes');

      _stateNotifier.setState(RecipeProviderState.fetchRecipesListSuccess);
    } catch (error) {
      _logging.warning('Error fetching recipes: $error');
      _stateNotifier.setState(
        RecipeProviderState.fetchRecipesListFailure,
        error.toString(),
      );
    }
  }

  @Deprecated('Use refreshListOfRecipesByCategory instead')
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

  Future<void> likeAndRefreshRecipe(String recipeId, bool isLike) async {
    try {
      if (isLike) {
        await _service.likeRecipe(recipeId: recipeId);
      } else {
        await _service.unlikeRecipe(recipeId: recipeId);
      }

      _logging.info('Liked recipe: $recipeId');
      _stateNotifier.setState(RecipeProviderState.likeRecipeSuccess);
    } catch (error) {
      _logging.warning('Error liking recipe: $error');
      _stateNotifier.setState(
        RecipeProviderState.likeRecipeFailure,
        error.toString(),
      );
    }
  }

  @Deprecated('Use likeAndRefreshRecipe instead')
  Future<void> likeRecipe(String recipeId) async {
    await _service.likeRecipe(recipeId: recipeId);
  }

  @Deprecated('Use likeAndRefreshRecipe instead')
  Future<void> refreshListOfLikedRecipes() async {
    _isLoading = true;
    notifyListeners();

    throw UnimplementedError();
  }

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
}
