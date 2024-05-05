import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_colors.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_fonts.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';
import 'package:pan_code_test/modules/post_list/controller/post_list_controller.dart';
import 'package:pan_code_test/modules/post_list/widget/post_item.dart';
import 'package:pan_code_test/modules/post_list/widget/post_item_shimmer.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

 @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late final PostListController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<PostListController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feeds",
          style: AppFonts.primaryBoldTextStyle,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          controller.pagingController.refresh();
        },
        child: Column(
          children: [
            Obx(
              () => Visibility(
                visible: controller.selectedTag.value != null,
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.padding),
                  child: Row(
                    children: [
                      Text(
                        "Filter by tag",
                        style: AppFonts.primaryBoldTextStyle,
                      ),
                      const SizedBox(
                        width: AppSize.smallPadding,
                      ),
                      InkWell(
                        onTap: () {
                          controller.removeFilterByTag();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.spaceSmall,
                            vertical: AppSize.extraSmallPadding,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(AppSize.radius),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.close_rounded,
                                color: AppColors.white,
                              ),
                              const SizedBox(
                                width: AppSize.extraSmallPadding,
                              ),
                              Text(
                                "${controller.selectedTag.value}",
                                style: AppFonts.whiteSemiBoldTextStyle.copyWith(
                                  fontSize: AppSize.caption,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PagedListView<int, PostEntity>(
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<PostEntity>(
                  itemBuilder: (context, item, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSize.padding),
                      child: FutureBuilder(
                        future: controller.loadLikeStatus(item),
                        builder: (context, AsyncSnapshot<bool> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const PostItemShimmer();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            bool isFavorite = snapshot.data ?? false;
                            return PostItem(
                              post: item,
                              isFavorite: isFavorite,
                              onSelectTag: (val) {
                                controller.filterByTag(val);
                              },
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
            ),
          ],
        ),
      ),
    );
  }
}
