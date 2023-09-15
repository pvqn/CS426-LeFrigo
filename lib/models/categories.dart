import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class Categories {
  const Categories({
    required this.id,
    required this.imageId,
    required this.name,
    required this.recipes,
  });

  @JsonKey(name: '_id')
  final String id;

  final String imageId;

  final String name;

  final List<String> recipes;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}
