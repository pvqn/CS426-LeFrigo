import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
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
  uploadRecipeSuccess,
  uploadRecipeFailure,
  deleteRecipeSuccess,
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
        _recipeCache[category.name]['recipes'] = category.recipes;

        _logging.info(
            'Fetched Categories: $category with imageId ${imageIdsOfCategory(category.name)}');
      }

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

  List<String> _popularRecipesId = [];
  List<String> get popularRecipes => _popularRecipesId;

  Future<void> refreshListOfRecipesByCategory(
      {required String category}) async {
    _stateNotifier.setLoading();
    notifyListeners();

    try {
      final recipes =
          await _service.getListOfRecipesByCategory(category: category);

      _recipeCache[category]['recipes'] = recipes;

      _logging.info('Fetched Recipes: $recipes');

      _stateNotifier.setState(RecipeProviderState.fetchRecipesListSuccess);
    } catch (error) {
      _logging.warning('Error fetching recipes: $error');
      _stateNotifier.setState(
        RecipeProviderState.fetchRecipesListFailure,
        error.toString(),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<void> uploadRecipe({
    required String name,
    required String description,
    required String category,
    required Details details,
    required List<Ingredients> ingredients,
    required Nutrition nutrition,
    required List<String> directions,
    required XFile image,
  }) async {
    try {
      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);

      await _service.uploadRecipe(
        name: name,
        description: description,
        category: category,
        details: details,
        nutrition: nutrition,
        ingredients: ingredients,
        steps: directions,
        encodedImage: base64Image,
      );

      _logging.info('upload recipe $name');
      _stateNotifier.setState(RecipeProviderState.uploadRecipeSuccess);
      notifyListeners();
    } catch (error) {
      _logging.warning('error uploading recipe');
      _stateNotifier.setState(
          RecipeProviderState.uploadRecipeFailure, error.toString());
      notifyListeners();
    }
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

  Future<Recipe> getRecipeById(String recipeId) async {
    try {
      final recipe = await _service.getRecipeById(id: recipeId);

      _logging.info('Fetched Recipe: ${recipe.id}');
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

      _logging.info('Fetched Popular Recipes: $recipes');
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

  final List<String> _ingredients = [];
  List<String> get ingredients => _ingredients;

  final List<String> _unitList = ['ounce', 'gram', 'cup', 'tablespoon'];
  List<String> get unitList => _unitList;

  Future<List<String>> getListOfIngredients() async {
    try {
      final ingredients = await _service.getListOfIngredients();

      _logging.info('Fetched Ingredients: $ingredients');
      return ingredients;
    } catch (error) {
      _logging.warning('Error fetching ingredients: $error');
      rethrow;
    }
  }

  Future<void> deleteRecipe({required String recipeId}) async {
    try {
      await _service.deleteRecipe(recipeId: recipeId);
      _logging.info('Deleted recipe with id: $recipeId');
      _stateNotifier.setState(RecipeProviderState.deleteRecipeSuccess);
      notifyListeners();
    } catch (error) {
      _logging.warning('Error deleting recipe: $error');
      _stateNotifier.setState(
        RecipeProviderState.deleteRecipeSuccess,
        error.toString(),
      );
      notifyListeners();
    }
  }
}
