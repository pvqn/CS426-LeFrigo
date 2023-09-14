import 'package:json_annotation/json_annotation.dart';

class ApiDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const ApiDateTimeConverter();

  @override
  DateTime? fromJson(String? value) =>
      value == null ? null : DateTime.parse(value);

  @override
  String? toJson(DateTime? value) => value?.toIso8601String();
}
