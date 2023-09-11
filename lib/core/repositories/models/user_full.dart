import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_full.g.dart';

class ApiDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const ApiDateTimeConverter();

  @override
  DateTime? fromJson(String? value) =>
      value == null ? null : DateTime.parse(value);

  @override
  String? toJson(DateTime? value) => value?.toIso8601String();
}

@immutable
@JsonSerializable()
class UserFull extends Equatable {
  const UserFull({
    required this.id,
    required this.email,
    this.avatar,
    this.username,
    this.dob,
    this.country,
    required this.posts,
    required this.likes,
    required this.createdAt,
  });

  @JsonKey(name: '_id')
  final String id;

  final String email;

  final String? avatar;

  final String? username;

  @ApiDateTimeConverter()
  final DateTime? dob;

  final String? country;

  final List<String> posts;

  final List<String> likes;

  @JsonKey(name: 'created_at')
  @ApiDateTimeConverter()
  final DateTime? createdAt;

  factory UserFull.fromJson(Map<String, dynamic> json) =>
      _$UserFullFromJson(json);

  Map<String, dynamic> toJson() => _$UserFullToJson(this);

  UserFull copyWith({
    String? id,
    String? email,
    String? avatar,
    String? username,
    DateTime? dob,
    String? country,
    List<String>? posts,
    List<String>? likes,
    DateTime? createdAt,
  }) {
    return UserFull(
      id: id ?? this.id,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      dob: dob ?? this.dob,
      country: country ?? this.country,
      posts: posts ?? this.posts,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static const guest = UserFull(
    id: 'guest',
    email: 'guest',
    avatar: null,
    username: null,
    dob: null,
    country: null,
    posts: [],
    likes: [],
    createdAt: null,
  );

  @override
  List<Object> get props => [id, email];
}
