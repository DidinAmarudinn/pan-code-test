import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/ui_constants/app_colors.dart';
import '../utils/ui_constants/app_fonts.dart';
import '../utils/ui_constants/app_size.dart';
class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final double buttonTextSize;
  final VoidCallback? onPressed;
  final double? height;
  final bool isLoading;
  final double? width;
  final Color? backgroundColor;
  final double? radius;
  final double? elevation;
  final bool enable;
  final bool isHaveBottomPadding;
  final Widget? icon;

  const PrimaryButton({
    super.key,
    this.width,
    this.height,
    required this.buttonText,
    this.enable = true,
    this.isLoading = false,
    required this.onPressed,
    this.buttonTextSize = 20,
    this.backgroundColor,
    this.radius,
    this.elevation,
    this.isHaveBottomPadding = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: isHaveBottomPadding ? AppSize.smallPadding : 0),
      child: SizedBox(
        height: height ?? 44,
        width: width ?? double.infinity,
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : ElevatedButton(
                onPressed: enable ? onPressed : null,
                style: TextButton.styleFrom(
                  backgroundColor: backgroundColor ??
                      (enable
                          ? AppColors.primaryColor
                          : AppColors.borderColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.bigRadius),
                  ),
                  elevation: elevation ?? 1,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonText,
                        style: enable
                            ? AppFonts.whiteSemiBoldTextStyle
                            : AppFonts.greySemiBoldTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
