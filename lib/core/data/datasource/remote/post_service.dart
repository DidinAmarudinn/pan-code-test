import 'package:dio/dio.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/data/model/response/comment_model.dart';
import 'package:pan_code_test/core/data/model/response/post_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/response/base_model.dart';
part 'post_service.g.dart';

@RestApi()
abstract class PostService {
  factory PostService(Dio dio, {String baseUrl}) = _PostService;

  @GET("user/{userId}/post")
  Future<BaseModel<List<PostModel>>> getUserPost(
    @Path("userId") String userId,
    @Queries() PaginationParams params,
  );

  @GET("/post")
  Future<BaseModel<List<PostModel>>> getAllPosts(
    @Queries() PaginationParams params,
  );
  
  @GET("/tag/{tag}/post")
  Future<BaseModel<List<PostModel>>> getPostByTag(
    @Queries() PaginationParams params,
    @Path("tag") String tag,
  );

  @GET("/post/{postId}/comment")
  Future<BaseModel<CommentModel>> getCommentByPost(
    @Path("postId") String postId,
  );
}
