
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/repositories/user_repository.dart';

class AddFriendUsecase extends Usecase<String, UserEntity> {
  final UserRepository _repository;

  AddFriendUsecase(this._repository);

  @override
  Future<Either<Failure,String>> call(UserEntity params) {
    return _repository.addFriend(params);
  }
}
