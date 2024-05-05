import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_colors.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';
import 'package:shimmer/shimmer.dart';

class PostItemShimmer extends StatelessWidget {
  const PostItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSize.padding),
      padding: const EdgeInsets.all(AppSize.smallPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            spreadRadius: 2,
            blurRadius: 40,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                    child: Container(
                      height: 45,
                      width: 45,
                      color: Colors.white, // Adjust as needed
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.spaceSmall),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: double.infinity,
                        color: Colors.white, // Adjust as needed
                      ),
                      const SizedBox(height: AppSize.extraSmallPadding),
                      Container(
                        height: 12,
                        width: double.infinity,
                        color: Colors.white, // Adjust as needed
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.smallPadding),
            Container(
              height: 14,
              width: double.infinity,
              color: Colors.white, // Adjust as needed
            ),
            const SizedBox(height: AppSize.smallPadding),
            Container(
              height: Get.height * 0.17,
              width: double.infinity,
              color: Colors.white, // Adjust as needed
            ),
            const SizedBox(height: AppSize.smallPadding),
            Container(
              height: 24,
              width: double.infinity,
              color: Colors.white, // Adjust as needed
            ),
          ],
        ),
      ),
    );
  }
}