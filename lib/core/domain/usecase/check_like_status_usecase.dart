
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/repositories/post_repository.dart';

class CheckLikeStatusUsecase extends Usecase<bool, PostEntity> {
  final PostRepository _repository;

  CheckLikeStatusUsecase(this._repository);

  @override
  Future<Either<Failure,bool>> call(PostEntity params) {
    return _repository.isLiked(params);
  }
}
