
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
  final AuthController authController = Get.find();
  final TripController tripController = Get.find();


  final List<Widget> pages = [
    SearchPage(),
    DisplayTripsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Obx(() => pages[tripController.currentIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        color: Color(0xff656c7c),
        activeColor: Color(0xff1E293B),
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon:Icon(Icons.search,color: Color(0xff959292),), title: 'بحث',fontFamily: 'Tajawal',activeIcon: Icon(Icons.search,color:  Color(0xff1E293B),)),
          TabItem(icon: Icons.home, title: 'الرئيسية ',fontFamily: 'Tajawal'),
          TabItem(icon: Icon(Icons.person,color: Color(0xff959292),), title: 'البروفايل',fontFamily: 'Tajawal',activeIcon: Icon(Icons.person,color:  Color(0xff1E293B),)),
        ],
        initialActiveIndex: tripController.currentIndex.value,
        onTap: (index) => tripController.currentIndex.value = index,
      ),
    );
  }
}
