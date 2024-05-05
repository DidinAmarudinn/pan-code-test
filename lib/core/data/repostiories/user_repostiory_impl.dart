import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pan_code_test/core/data/datasource/local/local_datasource.dart';
import 'package:pan_code_test/core/data/datasource/remote/user_service.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/data/model/table/user_table.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/repositories/user_repository.dart';
import 'package:pan_code_test/core/utils/extensions/type_def.dart';

import '../../abstract/usecase.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService service;
  final LocalDataSource localDataSource;

  UserRepositoryImpl(this.service, this.localDataSource);

  @override
  FutureEither<List<UserEntity>> getUserList(PaginationParams params) async {
    try {
      final result = await service.getUserList(params);
      return right(result.data.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return left(Failure(message: e.message ?? "Internal Server Error"));
    }
  }

  @override
  FutureEither<UserEntity> getUserById(String params) async {
    try {
      final result = await service.getUserById(params);
      return right(result.toEntity());
    } on DioException catch (e) {
      return left(Failure(message: e.message ?? "Internal Server Error"));
    }
  }

  @override
  FutureEither<String> addFriend(UserEntity params) async {
    try {
      final result =
          await localDataSource.addFriend(UserTable.fromEntity(params));
      return Right(result);
    } on DatabaseException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  FutureEither<String> removeFriend(UserEntity params) async {
    try {
      final result =
          await localDataSource.removeFriend(UserTable.fromEntity(params));
      return Right(result);
    } on DatabaseException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  FutureEither<List<UserEntity>> getFriends() async {
    final result = await localDataSource.getFirends();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  FutureEither<bool> isFriend(UserEntity params)async {
    final result = await localDataSource.getUserById(params.id!);
    return Right(result != null);
  }
}
