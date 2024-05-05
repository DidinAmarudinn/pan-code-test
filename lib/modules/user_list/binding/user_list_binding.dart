import 'package:get/get.dart';
import 'package:pan_code_test/modules/user_list/controller/user_list_controller.dart';


class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(
      () => UserListController(),
    );
  }
}
