// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
      dob: const ApiDateTimeConverter().fromJson(json['dob'] as String?),
      country: json['country'] as String?,
      posts: (json['posts'] as List<dynamic>).map((e) => e as String).toList(),
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'username': instance.username,
      'dob': const ApiDateTimeConverter().toJson(instance.dob),
      'country': instance.country,
      'posts': instance.posts,
      'likes': instance.likes,
      'created_at': instance.createdAt.toIso8601String(),
    };
