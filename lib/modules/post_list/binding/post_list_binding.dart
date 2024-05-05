import 'package:get/get.dart';
import 'package:pan_code_test/modules/post_list/controller/post_list_controller.dart';


class PostListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostListController>(
      () => PostListController(),
    );
  }
}
