import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lefrigo/models/api_datetime_converter.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    this.avatar,
    this.username,
    this.dob,
    this.country,
    required this.posts,
    required this.likes,
    this.createdAt,
  });

  @JsonKey(name: '_id', includeToJson: false)
  final String id;

  final String email;

  final String? avatar;

  final String? username;

  @ApiDateTimeConverter()
  final DateTime? dob;

  final String? country;

  @JsonKey(includeToJson: false)
  final List<String> posts;

  @JsonKey(includeToJson: false)
  final List<String> likes;

  @JsonKey(name: 'created_at', includeToJson: false)
  @ApiDateTimeConverter()
  final DateTime? createdAt;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  Map<String, Object?> toJson() => _$UserToJson(this);

  User copyWith({
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
    return User(
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

  @override
  List<Object?> get props =>
      [id, email, avatar, username, dob, country, posts, likes, createdAt];

  static const empty = User(
    id: '',
    email: '',
    avatar: '',
    username: '',
    dob: null,
    country: '',
    posts: [],
    likes: [],
    createdAt: null,
  );
}
