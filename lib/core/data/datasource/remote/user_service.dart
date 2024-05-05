import 'package:dio/dio.dart';
import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/data/model/response/user_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/response/base_model.dart';
part 'user_service.g.dart';
@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;


  @GET("user")
  Future<BaseModel<List<UserModel>>> getUserList(
    @Queries() PaginationParams params
  );

  @GET("user/{userId}")
  Future<UserModel> getUserById(
    @Path("userId") String userId
  );

}