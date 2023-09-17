import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  @JsonKey(name: '_id', includeToJson: false)
  final String? id;

  @JsonKey(includeToJson: false)
  final String? author;

  @JsonKey(name: 'num_liked', includeToJson: false)
  final int? numLiked;

  final String name;

  final String description;

  final String category;

  final Details details;

  final Nutrition nutrition;

  final List<Ingredients> ingredients;

  final List<String> directions;

  @JsonKey(includeToJson: false)
  final String? imageId;

  @JsonKey(includeFromJson: false)
  final String? image;

  Recipe({
    this.id,
    this.author,
    this.numLiked,
    required this.name,
    required this.description,
    required this.category,
    required this.details,
    required this.nutrition,
    required this.ingredients,
    required this.directions,
    this.imageId,
    this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: 'Cook Time')
  final int cookTime;
  @JsonKey(name: 'Prep Time')
  final int prepTime;
  @JsonKey(name: 'Servings')
  final int servings;
  @JsonKey(name: 'Total Time')
  final int totalTime;

  Details({
    required this.cookTime,
    required this.prepTime,
    required this.servings,
    required this.totalTime,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class Nutrition {
  @JsonKey(name: 'Calories')
  final String calories;
  @JsonKey(name: 'Carbs')
  final String carbs;
  @JsonKey(name: 'Fat')
  final String fat;
  @JsonKey(name: 'Protein')
  final String protein;

  Nutrition({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionToJson(this);
}

@JsonSerializable()
class Ingredients {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'quantity')
  final String quantity;
  @JsonKey(name: 'unit')
  final String? unit;

  Ingredients({
    required this.name,
    required this.quantity,
    this.unit,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}
