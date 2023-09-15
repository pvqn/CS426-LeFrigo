// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['_id'] as String,
      imageId: json['imageId'] as String,
      name: json['name'] as String,
      recipes:
          (json['recipes'] as List<dynamic>).map((e) => e as String).toList(),
    );
