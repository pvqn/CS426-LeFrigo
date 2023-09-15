// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartialUser _$PartialUserFromJson(Map<String, dynamic> json) => PartialUser(
      username: json['username'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      dob: const ApiDateTimeConverter().fromJson(json['dob'] as String?),
    );

Map<String, dynamic> _$PartialUserToJson(PartialUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('email', instance.email);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('country', instance.country);
  writeNotNull('dob', const ApiDateTimeConverter().toJson(instance.dob));
  return val;
}
