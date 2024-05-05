import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/routes/app_pages.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_colors.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_fonts.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';
import 'package:pan_code_test/modules/friends/controller/firends_controller.dart';

import '../../user_list/widget/user_item.dart';
import '../../user_list/widget/user_item_shimmer.dart';

class FriendsScreen extends GetView<FriendsController> {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.pagingController.refresh();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Friends",
          style: AppFonts.primaryBoldTextStyle,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Durations.extralong1);
            controller.pagingController.refresh();
          },
          child: PagedListView<int, UserEntity>(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.padding, vertical: AppSize.padding),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<UserEntity>(
              itemBuilder: (context, item, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.userDetailScreen, arguments: item);
                  },
                  child: UserItem(
                    userEntity: item,
                  ),
                );
              },
              firstPageProgressIndicatorBuilder: (context) {
                return Column(
                  children: List.generate(
                    5,
                    (index) => const UserItemShimmer(),
                  ),
                );
              },
              noItemsFoundIndicatorBuilder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Friends Found",
                    style: AppFonts.primaryBoldTextStyle
                        .copyWith(fontSize: AppSize.subHeadline),
                  ),
                  const SizedBox(
                    height: AppSize.spaceSmall,
                  ),
                  Text(
                    "Add you friends on user list",
                    style: AppFonts.primaryLightTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
