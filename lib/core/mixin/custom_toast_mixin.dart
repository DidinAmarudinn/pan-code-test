import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pan_code_test/core/utils/ui_constants/app_colors.dart';

import '../utils/ui_constants/app_size.dart';

mixin CustomToastMixin {
  void toastSuccess({
    required String title,
    required String message,
    Duration? duration,
    double? pading,
  }) {
    Get.isSnackbarOpen ? Get.back() : null;
    Get.snackbar(
      title,
      message,
      colorText: AppColors.white,
      backgroundColor: AppColors.primaryColor,
      snackPosition: SnackPosition.TOP,
      borderWidth: 0.5,
      borderColor: AppColors.white,
      margin: const EdgeInsets.symmetric(
          vertical: AppSize.bigPadding, horizontal: AppSize.smallPadding),
      icon: Icon(
        Icons.check,
        color: AppColors.white,
      ),
      duration: duration ??
          const Duration(
            seconds: 2,
          ),
    );
  }

  void toastError({
    required String title,
    required String message,
    Duration? duration,
  }) {
    Get.isSnackbarOpen ? Get.back() : null;
    Get.snackbar(
      title,
      message,
      colorText: AppColors.white,
      backgroundColor: AppColors.red,
      snackPosition: SnackPosition.TOP,
      borderWidth: 0.5,
      borderColor: AppColors.red,
      margin: const EdgeInsets.symmetric(
          vertical: AppSize.bigPadding, horizontal: AppSize.smallPadding),
      icon: Icon(
        Icons.error,
        color: AppColors.white,
      ),
      duration: duration ?? const Duration(seconds: 2),
    );
  }
}
