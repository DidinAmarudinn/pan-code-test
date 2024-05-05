// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:pan_code_test/modules/home/binding/home_binding.dart';
import 'package:pan_code_test/modules/home/view/home_screen.dart';
import 'package:pan_code_test/modules/user_detail/binding/user_detail_binding.dart';
import 'package:pan_code_test/modules/user_detail/view/user_detail_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.home;

  static final routes = [
     GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
     GetPage(
      name: Routes.userDetailScreen,
      page: () => const UserDetailScreen(),
      binding: UserDetailBinding(),
    ),
  ];
}
