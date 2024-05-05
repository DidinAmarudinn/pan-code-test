import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/routes/app_pages.dart';
import 'core/di/injector.dart' as di;
import 'core/utils/ui_constants/app_fonts.dart';

void main() async {
  await di.initializeDependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: ThemeData.light(
        useMaterial3: false,
      ).copyWith(
        textTheme: AppTextTheme.theme,
      ),
    ),
  );
}
