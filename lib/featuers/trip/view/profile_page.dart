import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xff1E293B),
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          'الملف الشخصي',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Tajawal',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xff334155),
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(height: 20),
                Text(
                  '${authController.name}',
                  style:TextStyle(
                    color: Color(0xff1E293B),
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${authController.email}',
                  style: TextStyle(
                    color: Color(0xff334155),
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Color(0xffD1D5DB), thickness: 1),
                SizedBox(height: 20),
                buildProfileOption(Icons.phone, 'رقم الهاتف', 'غير متوفر',),
                buildProfileOption(Icons.location_on, 'العنوان', 'لم يتم تعيينه'),
                buildProfileOption(Icons.date_range, 'تاريخ التسجيل', '01/01/2024'),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1E293B),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Get.back(),
                  child: Text('رجوع',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileOption(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Color(0xff1E293B)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff1E293B),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff334155),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
