import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/auth_controller.dart';
import 'form_feild_componant.dart';
import 'submit_button_componant.dart';

class LogenComponant extends StatelessWidget {
  LogenComponant({super.key});
  final AuthController authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 30.h),
          FormFeildComponant(
            text: 'E-mail ID',
            icon: Icon(Icons.email_outlined, color: Colors.blue),
            text2: 'Please Enter an Email',
            text3: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            text4: 'Please Enter a valid mail',
          ),
          SizedBox(height: 16.h),
          FormFeildComponant(
            text: 'Password',
            icon: Icon(Icons.lock_outlined, color: Colors.blue),
            text2: 'Please Enter a Password',
            text3:
            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
            text4: 'Please Enter a valid Password',
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Obx(
                    () => Checkbox(
                  value: authController.isChacked.value,
                  onChanged: (value) => authController.isChacked.value = value!,
                  activeColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                ),
              ),
              Text(
                'Remember me',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: const Color(0xff64748B),
                ),
              ),
              SizedBox(width: 80.w),
              Text(
                'Forget Password?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: const Color(0xff2563EB),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  authController.login();
                }
              },
              child: SubmitButtonComponant(text: 'Login')),
          SizedBox(height: 24.h),
          Text(
            '------------------------ Or login with ------------------------',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff64748B),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Container(
                width: 140.w,
                height: 52.h,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                child: Row(
                  children: [
                    Icon(Icons.g_mobiledata_outlined, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text(
                      'Google',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xff64748B),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  border: Border.all(color: const Color(0xffCBD5E1)),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 140.w,
                height: 52.h,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                child: Row(
                  children: [
                    Icon(Icons.apple, size: 20.sp, color: const Color(0xff64748B)),
                    SizedBox(width: 8.w),
                    Text(
                      'Apple',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xff64748B),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  border: Border.all(color: const Color(0xffCBD5E1)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
