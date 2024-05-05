// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/data/datasource/local/local_datasource.dart';
import 'package:pan_code_test/core/data/datasource/remote/post_service.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/data/model/table/post_table.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/repositories/post_repository.dart';
import 'package:pan_code_test/core/utils/extensions/type_def.dart';

class PostRepositoryImpl extends PostRepository {
  final PostService service;
  final LocalDataSource localDataSource;

  PostRepositoryImpl(
    this.service,
    this.localDataSource,
  );

  @override
  FutureEither<List<PostEntity>> getPostByUser(
      PaginationParams<String> params) async {
    try {
      final result = await service.getUserPost(params.data!, params);
      return right(result.data.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return left(Failure(message: e.message ?? "Internal Server Error"));
    }
  }

  @override
  FutureEither<List<PostEntity>> getAllPost(PaginationParams params) async {
    try {
      final result = await service.getAllPosts(params);
      return right(result.data.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return left(Failure(message: e.message ?? "Internal Server Error"));
    }
  }

  @override
  FutureEither<List<PostEntity>> getPostByTag(
      PaginationParams<String> params) async {
    try {
      final result = await service.getPostByTag(params, params.data!);
      return right(result.data.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return left(Failure(message: e.message ?? "Internal Server Error"));
    }
  }

  @override
  FutureEither<String> addLikedPost(PostEntity params) async {
    try {
      final result =
          await localDataSource.addLikedPost(PostTable.fromEntity(params));
      return Right(result);
    } on DatabaseException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  FutureEither<String> removeLikedPost(PostEntity params) async {
    try {
      final result =
          await localDataSource.removeLikedPost(PostTable.fromEntity(params));
      return Right(result);
    } on DatabaseException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  FutureEither<List<PostEntity>> getLikedPost() async {
    final result = await localDataSource.getLikedPost();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  FutureEither<bool> isLiked(PostEntity params) async {
    final result = await localDataSource.getLikedPostById(params.id!);
    return Right(result != null);
  }
}
