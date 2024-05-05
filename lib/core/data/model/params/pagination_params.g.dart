// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationParams<T> _$PaginationParamsFromJson<T>(Map<String, dynamic> json) =>
    PaginationParams<T>(
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationParamsToJson<T>(
        PaginationParams<T> instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
    };
