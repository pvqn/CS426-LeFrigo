// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
      dob: const ApiDateTimeConverter().fromJson(json['dob'] as String?),
      country: json['country'] as String?,
      posts: (json['posts'] as List<dynamic>).map((e) => e as String).toList(),
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt:
          const ApiDateTimeConverter().fromJson(json['created_at'] as String?),
    );
