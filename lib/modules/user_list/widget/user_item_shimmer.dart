import 'package:flutter/material.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';
import 'package:shimmer/shimmer.dart';

class UserItemShimmer extends StatelessWidget {
  const UserItemShimmer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: AppSize.smallPadding,),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        const Divider(height: AppSize.bigPadding,thickness: 0.5,)
      ],
    );
  }
}