import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickedButtonComponant extends StatelessWidget {
  const ClickedButtonComponant({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h, // ارتفاع الزر يتأقلم مع الشاشة
      width: 162.w, // عرض الزر يتأقلم مع الشاشة
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ), // تعديل البادينغ أيضًا عشان يناسب أي شاشة
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(48.r), // زوايا دائرية تتأقلم
        border: Border.all(color: Color(0xffCBD5E1)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp, // حجم الخط صار ديناميكي
          fontWeight: FontWeight.w600,
          color: Color(0xff334155),
        ),
      ),
    );
  }
}
