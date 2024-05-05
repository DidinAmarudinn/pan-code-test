import 'package:json_annotation/json_annotation.dart';
part 'pagination_params.g.dart';

@JsonSerializable()
class PaginationParams<T> {
  int limit;
  int page;
  @JsonKey(includeToJson: false, includeFromJson: false)
  T? data;

  PaginationParams({required this.limit, required this.page, this.data});

  factory PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationParamsToJson(this);
}
