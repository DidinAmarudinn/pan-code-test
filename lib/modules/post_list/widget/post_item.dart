// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/utils/extensions/datetime_ext.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_colors.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_fonts.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';

class PostItem extends StatelessWidget {
  final PostEntity post;
  final Function(String tag)? onSelectTag;
  final bool isFavorite;
  final VoidCallback? onClickFavorite;
  const PostItem({
    super.key,
    required this.post,
    this.onSelectTag,
    this.onClickFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSize.padding),
      padding: const EdgeInsets.all(AppSize.smallPadding),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            AppSize.radius,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.06), // Color and opacity of the shadow
              spreadRadius: 2, // Spread radius of the shadow
              blurRadius: 40, // Blur radius of the shadow
              offset:
                  const Offset(0, 2), // Offset of the shadow from the widget
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
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
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                          imageUrl: post.owner?.picture ?? "",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.spaceSmall,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.owner?.getfullName() ?? "",
                            style: AppFonts.primaryBoldTextStyle,
                          ),
                          Text(
                            post.publishDate.toCustomPostFormat(),
                            style: AppFonts.primaryLightTextStyle.copyWith(
                              fontSize: AppSize.caption,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
            onPressed: onClickFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: AppColors.red,
            ),
          )
            ],
          ),
          const SizedBox(
            height: AppSize.smallPadding,
          ),
          Text(
            post.text ?? "",
            style: AppFonts.primaryRegularTextStyle.copyWith(height: 1.5),
          ),
          const SizedBox(
            height: AppSize.smallPadding,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.radius),
            child: CachedNetworkImage(
              height: Get.height * 0.17,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: post.image ?? "",
            ),
          ),
          const SizedBox(
            height: AppSize.smallPadding,
          ),
          Wrap(
            children: (post.tags ?? [])
                .map(
                  (tag) => IntrinsicWidth(
                    child: InkWell(
                      onTap: () {
                        if (onSelectTag != null) {
                          onSelectTag!(tag);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.spaceSmall,
                          vertical: AppSize.extraSmallPadding,
                        ),
                        margin:
                            const EdgeInsets.only(right: AppSize.spaceSmall),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(AppSize.radius),
                        ),
                        child: Text(
                          "#$tag",
                          style: AppFonts.whiteSemiBoldTextStyle.copyWith(
                            fontSize: AppSize.caption,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          
        ],
      ),
    );
  }
}
