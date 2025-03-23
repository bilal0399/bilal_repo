
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:final_project2/featuers/trip/view/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../auth/controllers/auth_controller.dart';

import '../controllers/trip_controller.dart';

import 'display_trips_page/display_trips_page.dart';
import 'serch_page.dart';


class HomePage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TripController tripController = Get.put(TripController());


  final List<Widget> pages = [
    SearchPage(),
    DisplayTripsPage(),
    ProfilePage(),
    // SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Obx(()=> pages[tripController.currentIndex.value]),
      bottomNavigationBar:  ConvexAppBar(
          backgroundColor: Color(0xff1E293B),
          color: Color(0xff334155),
          activeColor: Color(0xffF1F5F9),
          style: TabStyle.fixedCircle,
          items: [
            TabItem(icon: Icons.search, title: 'بحث'),
            TabItem(icon: Icons.home, title: 'الرئيسية'),
            TabItem(icon: Icons.settings, title: 'الإعدادات'),
          ],
          initialActiveIndex:tripController.currentIndex.value ,
          onTap: (index) => tripController.currentIndex.value= index),
    );
  }
}