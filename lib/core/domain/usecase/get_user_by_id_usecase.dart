
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/repositories/user_repository.dart';

class GetUserByIdUsecase extends Usecase<UserEntity, String> {
  final UserRepository _repository;

  GetUserByIdUsecase(this._repository);

  @override
  Future<Either<Failure,UserEntity>> call(String params) {
    return _repository.getUserById(params);
  }
}
