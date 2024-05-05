import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_fonts.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';
import 'package:pan_code_test/modules/like/controller/like_controller.dart';
import 'package:pan_code_test/modules/post_list/widget/post_item.dart';
import 'package:pan_code_test/modules/post_list/widget/post_item_shimmer.dart';

import '../../../core/utils/ui_constants/app_colors.dart';

class LikeScreen extends GetView<LikeController> {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.pagingController.refresh();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Likes",
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
          child: PagedListView<int, PostEntity>(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.padding, vertical: AppSize.padding),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<PostEntity>(
              itemBuilder: (context, item, index) {
                return PostItem(
                  post: item,
                  isFavorite: true,
                  onClickFavorite: () {
                    controller.removeLike(item);
                  },
                );
              },
              firstPageProgressIndicatorBuilder: (context) {
                return Column(
                  children: List.generate(
                    5,
                    (index) => const PostItemShimmer(),
                  ),
                );
              },
              noItemsFoundIndicatorBuilder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Liked Post Found",
                    style: AppFonts.primaryBoldTextStyle
                        .copyWith(fontSize: AppSize.subHeadline),
                  ),
                  const SizedBox(
                    height: AppSize.spaceSmall,
                  ),
                  Text(
                    "Like your first post",
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
