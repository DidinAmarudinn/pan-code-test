
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/repositories/post_repository.dart';

class RemoveLikedPostUsecase extends Usecase<String, PostEntity> {
  final PostRepository _repository;

  RemoveLikedPostUsecase(this._repository);

  @override
  Future<Either<Failure,String>> call(PostEntity params) {
    return _repository.removeLikedPost(params);
  }
}
