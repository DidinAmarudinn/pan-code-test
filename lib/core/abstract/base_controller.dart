
import 'package:get/get.dart';
import 'package:pan_code_test/core/mixin/custom_toast_mixin.dart';

class BaseController extends GetxController with CustomToastMixin {
  RxBool isLoading = false.obs;
  
}