

import 'package:final_project2/featuers/trip/binding/trip_binding.dart';
import 'package:final_project2/featuers/trip/view/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../featuers/auth/bindings/auth_binding.dart';
import '../featuers/auth/views/auth_page.dart';

import '../featuers/splash/splash_binding.dart';
import '../featuers/splash/splash_screen.dart';
import '../featuers/trip/view/profile_page.dart';
import '../featuers/trip/view/serch_page.dart';
import '../featuers/trip/view/trip_datiles_page.dart';

class AppRouter  {
  static const String authPage ="/auth";
  static const String splashPage ="/splash";
  static const String home ="/home";
  static const String profile ="/profile";
  static const String serch ="/serch";
  static const String datiles ="/datiles";


  static List<GetPage> appPages=[
    GetPage(name: authPage, page:()=>AuthPage(),binding:AuthBinding() ),
    GetPage(name: datiles, page:()=>TripDatilsPage(),binding: TripBinding()),
    GetPage(name: serch, page:()=>SearchPage() ,binding: TripBinding()),
    GetPage(name: home, page: ()=>HomePage(),bindings:[ TripBinding(),AuthBinding()]),
    GetPage(name: splashPage, page:()=>SplashScreen(),binding:SplashBinding() ),
    GetPage(name: profile, page:()=>ProfilePage(),binding: TripBinding()),
  ];
}