import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/utils/extensions/type_def.dart';

abstract class PostRepository {
  FutureEither<List<PostEntity>> getPostByUser(PaginationParams<String> params);
  FutureEither<List<PostEntity>> getAllPost(PaginationParams params);
  FutureEither<List<PostEntity>> getPostByTag(PaginationParams<String> params);
  FutureEither<String> addLikedPost(PostEntity params);
  FutureEither<String> removeLikedPost(PostEntity params);
  FutureEither<List<PostEntity>> getLikedPost();
  FutureEither<bool> isLiked(PostEntity params);
}
