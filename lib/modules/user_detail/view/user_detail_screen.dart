import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/utils/extensions/datetime_ext.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_colors.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';
import 'package:pan_code_test/core/widget/primary_button.dart';
import 'package:pan_code_test/modules/user_detail/controller/user_detail_controller.dart';
import 'package:pan_code_test/modules/post_list/widget/post_item.dart';
import 'package:pan_code_test/modules/post_list/widget/post_item_shimmer.dart';

import '../../../core/utils/ui_constants/app_fonts.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late final UserDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<UserDetailController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.navigate_before,
            color: AppColors.primaryColor,
            size: 32,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Durations.extralong2);
          controller.refresh();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSize.padding),
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 1,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: CachedNetworkImage(
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                                imageUrl:
                                    controller.userData.value?.picture ?? "",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.smallPadding,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.userData.value?.getfullName() ??
                                      "",
                                  style: AppFonts.primaryBoldTextStyle,
                                ),
                                const SizedBox(
                                  height: AppSize.spaceSmall,
                                ),
                                Text(
                                  controller.userData.value?.email ?? "",
                                  style: AppFonts.primaryLightTextStyle,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.smallPadding,
                    ),
                    Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Birthdate",
                                  style: AppFonts.primaryLightTextStyle,
                                ),
                                const SizedBox(
                                  height: AppSize.extraSmallPadding,
                                ),
                                Text(
                                  controller.userData.value?.dateOfBirth
                                          ?.toCustomFormatString() ??
                                      "-",
                                  style:
                                      AppFonts.primaryRegularTextStyle.copyWith(
                                    fontSize: AppSize.caption,
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.spaceSmall,
                                ),
                                Text(
                                  "Address",
                                  style: AppFonts.primaryLightTextStyle,
                                ),
                                const SizedBox(
                                  height: AppSize.extraSmallPadding,
                                ),
                                Text(
                                  controller.userData.value?.location
                                          ?.getFullLocation() ??
                                      "-",
                                  style: AppFonts.primaryRegularTextStyle
                                      .copyWith(
                                          fontSize: AppSize.caption,
                                          height: 1.3),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.smallPadding,
                          ),
                          PrimaryButton(
                            backgroundColor: controller.isFriend.value
                                ? AppColors.grey
                                : AppColors.primaryColor,
                            buttonText: controller.isFriend.value
                                ? "Unfollow"
                                : "Follow",
                            onPressed: () {
                              if (controller.isFriend.value) {
                                controller.removeFriend();
                              } else {
                                controller.addFriend();
                              }
                            },
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: AppSize.padding,
              ),
            ),
            PagedSliverList<int, PostEntity>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<PostEntity>(
                itemBuilder: (context, item, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.padding,
                    ),
                    child: FutureBuilder(
                      future: controller.loadLikeStatus(item),
                      builder: (context, AsyncSnapshot<bool> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const PostItemShimmer();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          bool isFavorite = snapshot.data ?? false;
                          return PostItem(
                            post: item,
                            isFavorite: isFavorite,
                            onClickFavorite: () {
                              if (isFavorite) {
                                controller.removeLike(item);
                              } else {
                                controller.addLike(item);
                              }
                              setState(() {});
                            },
                          );
                        }
                      },
                    ),
                  );
                },
                firstPageProgressIndicatorBuilder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(AppSize.padding),
                    child: Column(
                      children: List.generate(
                        1,
                        (index) => const PostItemShimmer(),
                      ),
                    ),
                  );
                },
                newPageProgressIndicatorBuilder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(AppSize.padding),
                    child: Column(
                      children: List.generate(
                        1,
                        (index) => const PostItemShimmer(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
