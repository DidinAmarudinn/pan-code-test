
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/domain/repositories/user_repository.dart';

class GetUserListUsecase extends Usecase<List<UserEntity>, PaginationParams> {
  final UserRepository _repository;

  GetUserListUsecase(this._repository);

  @override
  Future<Either<Failure,List<UserEntity>>> call(PaginationParams params) {
    return _repository.getUserList(params);
  }
}
