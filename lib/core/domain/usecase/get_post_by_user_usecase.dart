
import 'package:dartz/dartz.dart';
import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/repositories/post_repository.dart';

class GetPostByUserUsecase extends Usecase<List<PostEntity>, PaginationParams<String>> {
  final PostRepository _repository;

  GetPostByUserUsecase(this._repository);

  @override
  Future<Either<Failure,List<PostEntity>>> call(PaginationParams<String> params) {
    return _repository.getPostByUser(params);
  }
}
