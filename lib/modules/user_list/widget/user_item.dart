import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_fonts.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_size.dart';

class UserItem extends StatelessWidget {
  final UserEntity userEntity;
  const UserItem({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                height: 50,
                width: 50,
                imageUrl: userEntity.picture ?? "",
              ),
            ),
            const SizedBox(width: AppSize.smallPadding,),
            Expanded(
              child: Text(
                userEntity.getfullName(),
                style: AppFonts.primaryBoldTextStyle,
              ),
            )
          ],
        ),
        const Divider(height: AppSize.bigPadding,thickness: 0.5,)
      ],
    );
  }
}
