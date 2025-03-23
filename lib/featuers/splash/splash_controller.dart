

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/app_router.dart';
import '../../core/main_controller.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    final isLoggedIn = Get.find<MainController>().isLoggedIn.value;
    String route = AppRouter.authPage;
    if (isLoggedIn) {
      route = AppRouter.home;
    }

  Future.delayed(Duration(seconds:3),()=>Get.offAllNamed(route));
    super.onInit();
  }
}
