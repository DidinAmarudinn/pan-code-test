import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> {
  final T data;

  BaseModel({
    required this.data,
  });

  factory BaseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseModelFromJson(json, fromJsonT);
}
