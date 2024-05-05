import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pan_code_test/modules/friends/view/friends_screen.dart';
import 'package:pan_code_test/modules/home/controller/home_controller.dart';
import 'package:pan_code_test/modules/like/view/like_screen.dart';
import 'package:pan_code_test/modules/post_list/view/post_list_screen.dart';

import '../../../core/utils/ui_constants/app_colors.dart';
import '../../user_list/view/user_list_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static final List<Widget> _screens = <Widget>[
    const UserListScreen(),
    const PostListScreen(),
    const FriendsScreen(),
    const LikeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) {
            controller.onChangeIndex(value);
          },
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          selectedItemColor: AppColors.primaryColor,
          unselectedFontSize: 14,
          unselectedItemColor: AppColors.grey,
          iconSize: 24,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Friend',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Like',
            ),
          ],
        ),
      ),
    );
  }
}
