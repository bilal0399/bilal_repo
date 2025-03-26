
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_router.dart';
import 'core/main_controller.dart';
import 'featuers/auth/controllers/auth_controller.dart';

Future<void> main() async {
  Get.put(MainController(), permanent: true);
  final MainController mainController = Get.find();
  await mainController.getIsLoggedIn();
  Get.put(AuthController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.splashPage,
          getPages: AppRouter.appPages,
        );
      },
    );
  }
}
