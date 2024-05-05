
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/repositories/user_repository.dart';

class CheckIsFriendUsecase extends Usecase<bool, UserEntity> {
  final UserRepository _repository;

  CheckIsFriendUsecase(this._repository);

  @override
  Future<Either<Failure,bool>> call(UserEntity params) {
    return _repository.isFriend(params);
  }
}
