
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/main_controller.dart';
import '../models/auth_model.dart';
import '../servises/auth_service.dart';
import '../views/auth_page.dart';


class AuthController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;
  RxString phone = ''.obs;

  //
  RxBool isSignUp = false.obs;
  RxBool isInLoggingPage = true.obs;
  RxBool isChacked = false.obs;
  RxBool isPressContinue = true.obs;
  AuthModel? currentUser;
  @ override
  void onInit(){
    super.onInit();
    loadUserData();

  }

  void login() {
    currentUser = AuthService.login(email.value, password.value);
    if (currentUser != null) {
      Get.find<MainController>().isLoggedIn .value = true;
      Get.offAllNamed('/home');
    } else {
      Get.snackbar("Error", "Invalid Email or Password", snackPosition: SnackPosition.BOTTOM);
    }
    saveUserData();
  }

  void register() {
    var result = AuthService.register(email.value, password.value, name.value, phone.value);
    if (result != null) {
      Get.snackbar("Success", result, snackPosition: SnackPosition.BOTTOM);
      Get.find<MainController>().isLoggedIn.value = true;
      isSignUp.value = false;
      Get.offAllNamed('/home');
      saveUserData();
    } else {
      Get.snackbar("Error", "Registration failed. Please try again.", snackPosition: SnackPosition.BOTTOM);
    }
  }


  Future<void> logOut() async {
    Get.find<MainController>().isLoggedIn.value = false;
    currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(AuthPage());
  }


  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.value);
    await prefs.setString('email', email.value);
  }
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? "UserName";
    email.value = prefs.getString('email') ?? "No Email";

    if (email.value != "No Email") {
      Get.find<MainController>().isLoggedIn.value = true;
      Get.offAllNamed('/home');
    }
  }
}


