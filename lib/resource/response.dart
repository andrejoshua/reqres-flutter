import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ResourceResponse {
  ResourceResponse(
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  );

  factory ResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceResponseFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'year')
  final int year;

  @JsonKey(name: 'color')
  final String color;

  @JsonKey(name: 'pantone_value')
  final String pantoneValue;
}
