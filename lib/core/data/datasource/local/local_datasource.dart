import 'package:pan_code_test/core/data/model/table/post_table.dart';
import 'package:pan_code_test/core/data/model/table/user_table.dart';

abstract class LocalDataSource {
  Future<String> addFriend(UserTable user);
  Future<List<UserTable>> getFirends();
  Future<String> removeFriend(UserTable user);
  Future<UserTable?> getUserById(String id);
  Future<String> addLikedPost(PostTable post);
  Future<List<PostTable>> getLikedPost();
  Future<String> removeLikedPost(PostTable post);
  Future<PostTable?> getLikedPostById(String id);
}