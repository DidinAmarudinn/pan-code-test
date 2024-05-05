import 'package:pan_code_test/core/data/model/params/pagination_params.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/utils/extensions/type_def.dart';

abstract class UserRepository {
  FutureEither<List<UserEntity>> getUserList(PaginationParams params);
  FutureEither<UserEntity> getUserById(String params);
  FutureEither<String> addFriend(UserEntity params);
  FutureEither<String> removeFriend(UserEntity params);
  FutureEither<List<UserEntity>> getFriends();
  FutureEither<bool> isFriend(UserEntity params);
}