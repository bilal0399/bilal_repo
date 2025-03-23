import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/auth_controller.dart';
import 'form_feild_componant.dart';
import 'submit_button_componant.dart';
import 'type_user_button_componant.dart';

class RigesterComponant extends StatelessWidget {
  RigesterComponant({super.key});
  final AuthController authController = Get.put(AuthController());
  final formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => authController.isPressContinue.value
          ? Column(
        children: [
          SizedBox(height: 25.h),
          TypeUserButtonComponant(text: 'Loan Officer'),
          SizedBox(height: 12.h),
          TypeUserButtonComponant(text: 'Real Estate Agent'),
          SizedBox(height: 12.h),
          TypeUserButtonComponant(text: 'Buyer/Seller'),
          SizedBox(height: 12.h),
          TypeUserButtonComponant(text: 'Other'),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              authController.isPressContinue.value = false;
            },
            child: SubmitButtonComponant(text: 'Continue'),
          ),
        ],
      )
          : Form(
        key: formKey1,
        child: Column(
          children: [
            SizedBox(height: 30.h),
            FormFeildComponant(
              text: 'Full Name',
              icon: Icon(Icons.person_outline_rounded,
                  color: Colors.blue, size: 20.sp),
              text2: 'Please Enter a FullName',
              text3:
              r'^[A-Za-z\u0600-\u06FF]{2,}(?: [A-Za-z\u0600-\u06FF]{2,})+$',
              text4: 'Please Enter a valid Name',
            ),
            SizedBox(height: 16.h),
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
            FormFeildComponant(
              text: 'Phone No.',
              icon: Icon(Icons.phone, color: Colors.blue, size: 20.sp),
              text2: 'Please Enter a Phone Number',
              text3:
              r'^(?:\+?(\d{1,3}))?[-. ]?\(?\d{3}\)?[-. ]?\d{3}[-. ]?\d{4}$',
              text4: 'Please Enter a valid Phone Number',
            ),
            SizedBox(height: 16.h),
            // FormFeildComponant(
            //   text: 'License No.',
            //   icon: Icon(Icons.credit_card_rounded,
            //       color: Colors.blue, size: 20.sp),
            //   text2: 'Please Enter a License No',
            //   text3: r'^[A-Za-z0-9]{4,15}$',
            //   text4: 'Please Enter a valid License No',
            // ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                if (formKey1.currentState!.validate()) {
                  formKey1.currentState!.save();
                  authController.register();
                }
              },
              child: SubmitButtonComponant(text: 'Register'),
            ),
          ],
        ),
      ),
    );
  }
}
