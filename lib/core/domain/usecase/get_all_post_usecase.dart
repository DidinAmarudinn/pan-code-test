
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/repositories/post_repository.dart';

class GetAllPostUsecase extends Usecase<List<PostEntity>, PaginationParams> {
  final PostRepository _repository;

  GetAllPostUsecase(this._repository);

  @override
  Future<Either<Failure,List<PostEntity>>> call(PaginationParams params) {
    return _repository.getAllPost(params);
  }
}
