import 'package:get/get.dart';
import 'package:pan_code_test/modules/friends/controller/firends_controller.dart';
import 'package:pan_code_test/modules/home/controller/home_controller.dart';
import 'package:pan_code_test/modules/like/controller/like_controller.dart';
import 'package:pan_code_test/modules/post_list/controller/post_list_controller.dart';
import 'package:pan_code_test/modules/user_list/controller/user_list_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<UserListController>(
      () => UserListController(),
    );
    Get.lazyPut<PostListController>(
      () => PostListController(),
    );
    Get.lazyPut<LikeController>(
      () => LikeController(),
    );
    Get.lazyPut<FriendsController>(
      () => FriendsController(),
    );
  }
}
