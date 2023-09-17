import 'dart:convert';
import 'dart:io';

import 'package:lefrigo/models/recipe.dart';

import 'package:lefrigo/services/api_service.dart';

class RecipeServiceException implements Exception {
  final String message;

  RecipeServiceException({required this.message});
}

class RecipeService {
  final ApiService _apiService;

  RecipeService({required ApiService apiService}) : _apiService = apiService;

  Future<List<String>> getListOfCategories() async {
    final response = await _apiService.get(path: '/categories');

    if (response.type == ApiResponseType.success) {
      final categories = jsonDecode(response.message ?? '[]') as List<dynamic>;
      final categoriesList = categories.map((e) => e.toString()).toList();

      return categoriesList;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<List<String>> getListOfRecipesByCategory(
      {required String category}) async {
    final response = await _apiService.get(path: '/category/$category');

    if (response.type == ApiResponseType.success) {
      final recipes = jsonDecode(response.message ?? '[]') as List<dynamic>;
      final recipesList = recipes.map((e) => e.toString()).toList();

      return recipesList;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<Recipe> getRecipeById({required String id}) async {
    final response = await _apiService.get(path: '/recipe/$id');

    if (response.type == ApiResponseType.success) {
      final recipe = Recipe.fromJson(jsonDecode(response.message ?? '{}'));
      return recipe;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<List<String>> searchRecipeByName({required String name}) async {
    final response = await _apiService.get(path: '/recipe/search/$name');

    if (response.type == ApiResponseType.success) {
      final recipes = jsonDecode(response.message ?? '[]') as List<dynamic>;
      final recipesList = recipes.map((e) => e.toString()).toList();

      return recipesList;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<List<String>> getListOfIngredients() async {
    final response = await _apiService.get(path: '/ingredients');

    if (response.type == ApiResponseType.success) {
      final ingredients = jsonDecode(response.message ?? '[]') as List<dynamic>;
      final ingredientsList = ingredients.map((e) => e.toString()).toList();

      return ingredientsList;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<void> likeRecipe({required String recipeId}) async {
    final response = await _apiService.post(
      path: '/recipe/like',
      data: {
        'recipe_id': recipeId,
        'like': true,
      },
    );

    if (response.type == ApiResponseType.success) {
      return;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<void> unlikeRecipe({required String recipeId}) async {
    final response = await _apiService.post(
      path: '/recipe/like',
      data: {
        'recipe_id': recipeId,
        'like': false,
      },
    );

    if (response.type == ApiResponseType.success) {
      return;
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<void> deleteRecipe({required String recipeId}) async {
    final response = await _apiService.post(
      path: '/recipe/delete/$recipeId',
    );

    if (response.type == ApiResponseType.success) {
      final decode = jsonDecode(response.message ?? '{}');

      if (decode['success'] == true) {
        return;
      } else {
        throw RecipeServiceException(message: decode['message']);
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }

  Future<void> uploadRecipe({
    required String name,
    required String description,
    required String category,
    required Details details,
    required Nutrition nutrition,
    required List<Ingredients> ingredients,
    required List<String> steps,
    required String encodedImage,
  }) async {
    final response = await _apiService.post(
        path: '/recipe/upload',
        data: Recipe(
          name: name,
          description: description,
          category: category,
          details: details,
          nutrition: nutrition,
          ingredients: ingredients,
          directions: steps,
          image: encodedImage,
        ).toJson());

    if (response.type == ApiResponseType.success) {
      final decode = jsonDecode(response.message ?? '{}');

      if (decode['success'] == true) {
        return;
      } else {
        throw RecipeServiceException(message: decode['message']);
      }
    } else {
      throw const HttpException('Internet connection error');
    }
  }
}
