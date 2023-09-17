// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['_id'] as String?,
      author: json['author'] as String?,
      numLiked: json['num_liked'] as int?,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
      nutrition: Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      directions: (json['directions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'details': instance.details,
      'nutrition': instance.nutrition,
      'ingredients': instance.ingredients,
      'directions': instance.directions,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      cookTime: json['Cook Time'] as int,
      prepTime: json['Prep Time'] as int,
      servings: json['Servings'] as int,
      totalTime: json['Total Time'] as int,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'Cook Time': instance.cookTime,
      'Prep Time': instance.prepTime,
      'Servings': instance.servings,
      'Total Time': instance.totalTime,
    };

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
      calories: json['Calories'] as String,
      carbs: json['Carbs'] as String,
      fat: json['Fat'] as String,
      protein: json['Protein'] as String,
    );

Map<String, dynamic> _$NutritionToJson(Nutrition instance) => <String, dynamic>{
      'Calories': instance.calories,
      'Carbs': instance.carbs,
      'Fat': instance.fat,
      'Protein': instance.protein,
    };

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
    };
