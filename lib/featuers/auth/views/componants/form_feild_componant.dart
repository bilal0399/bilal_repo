import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/auth_controller.dart';

class FormFeildComponant extends StatelessWidget {
  FormFeildComponant({
    super.key,
    required this.text,
    required this.icon,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  final AuthController authController = Get.put(AuthController());

  final String text;
  final String text2;
  final String text3;
  final String text4;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h, // تعديل الارتفاع
      width: 342.w, // تعديل العرض
      child: TextFormField(
        onChanged: (value) {
          if (text == 'Full Name') {
            authController.name.value = value;
          } else if (text == 'E-mail ID') {
            authController.email.value = value;
          } else if (text == 'Password') {
            authController.password.value = value;
          } else if (text == 'Phone No.') {
            authController.phone.value = value;
          } 
        },
        validator: (Value) {
          if (Value == null || Value.isEmpty) {
            return text2;
          } else if (!RegExp(text3).hasMatch(Value)) {
            return text4;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          prefixIcon: icon,
          labelText: text,
          labelStyle: const TextStyle(color: Color(0xff64748B)),
          contentPadding:
          EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w), // تعديل البادينغ
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r), // تعديل نصف القطر
            borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
          ),
        ),
      ),
    );
  }
}
