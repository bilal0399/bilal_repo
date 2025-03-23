import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponant extends StatelessWidget {
  const ButtonComponant({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 44.h,
      width: 140.w,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xff64748B),
        ),
      ),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 12.h,
        bottom: 12.h,
      ),

      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(48),
      //   border: Border.all(color: Color(0xffCBD5E1)),
      // ),
    );
  }
}
