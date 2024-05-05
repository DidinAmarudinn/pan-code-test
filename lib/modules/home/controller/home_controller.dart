import 'package:get/get.dart';
import 'package:pan_code_test/core/abstract/base_controller.dart';

class HomeController extends BaseController {
  RxInt currentIndex = 0.obs;

  void onChangeIndex(int index){
    currentIndex.value = index;
  }
}