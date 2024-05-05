
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/repositories/post_repository.dart';

class GetLikedPostUsecase extends Usecase<List<PostEntity>, NoParams> {
  final PostRepository _repository;

  GetLikedPostUsecase(this._repository);

  @override
  Future<Either<Failure,List<PostEntity>>> call(NoParams params) {
    return _repository.getLikedPost();
  }
}
