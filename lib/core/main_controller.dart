import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController  extends GetxController{
  RxBool isLoggedIn = false.obs;
 Future<void> setIsLoggedIn({required bool status}) async{
   final prefs = await SharedPreferences.getInstance();
   await prefs.setBool('isLoggedIn', status);
   isLoggedIn.value = status;
 }
  Future<void> getIsLoggedIn( ) async{
    final prefs = await SharedPreferences.getInstance();
 bool status=     prefs.getBool('isLoggedIn')??false;
    isLoggedIn.value = status;
  }
}