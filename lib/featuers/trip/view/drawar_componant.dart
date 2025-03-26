import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../auth/controllers/auth_controller.dart';


class DrawarComponant extends StatelessWidget {
   DrawarComponant({super.key});
  final AuthController authController = Get.find<AuthController>();
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
                      backgroundImage: AssetImage(''),
                      child: Image.asset(
                        '',
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
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'تأكيد تسجيل الخروج',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'هل أنت متأكد أنك تريد تسجيل الخروج؟',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Tajawal', fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                ),
                                child: Text(
                                  'إلغاء',
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  authController.logOut();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff1E293B),
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                ),
                                child: Text(
                                  'نعم',
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
