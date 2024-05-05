import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/routes/app_pages.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_colors.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_fonts.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';
import 'package:pan_code_test/modules/user_list/controller/user_list_controller.dart';
import 'package:pan_code_test/modules/user_list/widget/user_item.dart';
import 'package:pan_code_test/modules/user_list/widget/user_item_shimmer.dart';

class UserListScreen extends GetView<UserListController> {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fun Social",style: AppFonts.primaryBoldTextStyle,),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Durations.extralong1);
            controller.refresh();
          },
          child: PagedListView<int, UserEntity>(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.padding, vertical: AppSize.padding),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<UserEntity>(
              itemBuilder: (context, item, index) {
                return InkWell(
                  onTap: (){
                    Get.toNamed(Routes.userDetailScreen,arguments: item);
                  },
                  child: UserItem(userEntity: item));
              },
              firstPageProgressIndicatorBuilder: (context) {
                return Column(
                  children: List.generate(
                    5,
                    (index) => const UserItemShimmer(),
                  ),
                );
              },
              newPageProgressIndicatorBuilder: (context) {
                return Column(
                  children: List.generate(
                    2,
                    (index) => const UserItemShimmer(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
