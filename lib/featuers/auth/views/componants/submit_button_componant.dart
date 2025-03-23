import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButtonComponant extends StatelessWidget {
   SubmitButtonComponant({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 45.h,
      padding: EdgeInsets.all(16),
      width: 342.w,
      child: Text(text,textAlign: TextAlign.center,style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: Color(0xff2563EB),
      ),
    );
  }
}
