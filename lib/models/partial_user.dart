import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lefrigo/models/api_datetime_converter.dart';

part 'partial_user.g.dart';

@immutable
@JsonSerializable(includeIfNull: false)
class PartialUser {
  final String? username;
  final String? email;
  final String? avatar;
  final String? country;
  @ApiDateTimeConverter()
  final DateTime? dob;

  const PartialUser({
    this.username,
    this.email,
    this.avatar,
    this.country,
    this.dob,
  });

  factory PartialUser.fromJson(Map<String, dynamic> json) =>
      _$PartialUserFromJson(json);

  Map<String, dynamic> toJson() => _$PartialUserToJson(this);
}
