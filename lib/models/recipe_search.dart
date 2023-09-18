import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_search.g.dart';

@JsonSerializable(createToJson: false)
class RecipeSearch extends Equatable {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  const RecipeSearch({
    required this.id,
    required this.name,
  });

  factory RecipeSearch.fromJson(Map<String, dynamic> json) =>
      _$RecipeSearchFromJson(json);

  @override
  List<Object?> get props => [id, name];
}
