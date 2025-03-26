import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/auth_controller.dart';
import 'componants/button_componant.dart';
import 'componants/clicked_button_componant.dart';
import 'componants/logen_componant.dart';
import 'componants/rigester_componant.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xff334155),
              Color(0xff1E293B),
              Color(0xff0F172A),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                      () => Text(
                    authController.isInLoggingPage.value
                        ? 'Go ahead and set up \n your account'
                        : 'Create your \n account',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Sign in-up to enjoy the best managing experience',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color(0xff94A3B8),
                    fontSize: 12.sp,

                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: Container(
                height: 598.h,
                width: 420.w,
                padding: EdgeInsets.all(25.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Obx(
                          () => Container(
                        padding: EdgeInsets.all(4.w),
                        height: 52.h,
                        width: 342.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                authController.isInLoggingPage.value = true;
                                authController.isPressContinue.value = true;
                              },
                              child: authController.isInLoggingPage.value
                                  ? ClickedButtonComponant(text: 'Login')
                                  : ButtonComponant(text: 'Login'),
                            ),
                            InkWell(
                              onTap: () {
                                authController.isInLoggingPage.value = false;
                              },
                              child: !authController.isInLoggingPage.value
                                  ? ClickedButtonComponant(text: 'Register')
                                  : ButtonComponant(text: 'Register'),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE2E8F0),
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                      ),
                    ),
                    Obx(
                          () => authController.isInLoggingPage.value
                          ? LogenComponant()
                          : RigesterComponant(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
