import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(createToJson: false)
class RecipeCategory extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'imageid')
  final String? image;

  @JsonKey(includeFromJson: false)
  final String? imageByte;

  final List<String>? recipes;

  const RecipeCategory({
    required this.name,
    this.image,
    this.imageByte,
    this.recipes,
  });

  RecipeCategory copyWith({
    String? imageByte,
  }) {
    return RecipeCategory(
      name: name,
      image: image,
      imageByte: imageByte ?? this.imageByte,
      recipes: recipes,
    );
  }

  factory RecipeCategory.fromJson(Map<String, dynamic> json) =>
      _$RecipeCategoryFromJson(json);

  @override
  List<Object?> get props => [name];
}
