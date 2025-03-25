import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../auth/controllers/auth_controller.dart';


class DrawarComponant extends StatelessWidget {
   DrawarComponant({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(
                  () => Container(
                color: Color(0xff1E293B),
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: AssetImage('assets/images/default_profile.png'), // استبدالها بالرابط الفعلي للصورة
                      child: Image.asset(
                        '', // استبدالها بالرابط الفعلي للصورة
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey.shade500,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${authController.name}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '${authController.email}',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xff334155)),
              title: Text('الرئيسية',style: TextStyle(fontFamily: 'Tajawal'),),
              onTap: () {
                Get.toNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Color(0xff334155)),
              title: Text('حول التطبيق',style: TextStyle(fontFamily: 'Tajawal'),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Color(0xff334155)),
              title: Text('تسجيل الخروج',style: TextStyle(fontFamily: 'Tajawal'),),
              onTap: () {
                Get.defaultDialog(
                  titleStyle: TextStyle(
                    fontFamily: 'Tajawal',
                  ),
                  title: "تأكيد تسجيل الخروج",
                  middleText: "هل أنت متأكد أنك تريد تسجيل الخروج؟",
                  textConfirm: "نعم",
                  textCancel: "إلغاء",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    authController.logOut();
                    Get.back();
                  },
                  onCancel: () => Get.back(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
