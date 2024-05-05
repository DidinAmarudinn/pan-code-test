import 'package:get/get.dart';
import 'package:pan_code_test/modules/user_detail/controller/user_detail_controller.dart';


class UserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailController>(
      () => UserDetailController(),
    );
  }
}
