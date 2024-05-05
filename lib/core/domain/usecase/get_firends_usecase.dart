
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/repositories/user_repository.dart';

class GetFriendUsecase extends Usecase<List<UserEntity>, NoParams> {
  final UserRepository _repository;

  GetFriendUsecase(this._repository);

  @override
  Future<Either<Failure,List<UserEntity>>> call(NoParams params) {
    return _repository.getFriends();
  }
}
