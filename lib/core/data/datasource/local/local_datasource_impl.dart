import 'package:pan_code_test/core/abstract/usecase.dart';
import 'package:pan_code_test/core/data/datasource/local/local_datasource.dart';
import 'package:pan_code_test/core/data/model/table/post_table.dart';
import 'package:pan_code_test/core/data/model/table/user_table.dart';
import 'package:pan_code_test/core/helper/database_helper.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl(this.databaseHelper);

  @override
  Future<String> addFriend(UserTable user) async {
    try {
      await databaseHelper.addFriend(user);
      return 'Added to friend';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<UserTable>> getFirends() async {
    final result = await databaseHelper.getFriends();
    return result.map((data) => UserTable.fromMap(data)).toList();
  }

  @override
  Future<String> removeFriend(UserTable user) async {
    try {
      await databaseHelper.removeFriend(user);
      return 'Removed from friend';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<UserTable?> getUserById(String id) async {
    final result = await databaseHelper.getFriendsById(id);
    if (result != null) {
      return UserTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> addLikedPost(PostTable post) async {
    try {
      await databaseHelper.addLikedPost(post);
      return 'Added to liked post';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeLikedPost(PostTable post) async {
    try {
      await databaseHelper.removeLikedPost(post);
      return 'Removed from liked post';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<PostTable>> getLikedPost() async {
    final result = await databaseHelper.getLikedPost();
    return result.map((data) => PostTable.fromMap(data)).toList();
  }

  @override
  Future<PostTable?> getLikedPostById(String id) async {
    final result = await databaseHelper.getLikedPostById(id);
    if (result != null) {
      return PostTable.fromMap(result);
    } else {
      return null;
    }
  }
}
