// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeCategory _$RecipeCategoryFromJson(Map<String, dynamic> json) =>
    RecipeCategory(
      name: json['name'] as String,
      image: json['imageid'] as String?,
      recipes:
          (json['recipes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
