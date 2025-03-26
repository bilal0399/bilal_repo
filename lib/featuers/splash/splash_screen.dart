import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.only(right: 75),
              child: Lottie.asset(
                'assets/animations/anim2.json',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(height: 20),

            Text(
              "مرحبا بك   \n سافر في سوريا بكل راحة ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
                color: Color(0xff0e3cb1),
              ),
            ),
             SizedBox(height: 10),
            // نص إضافي
            Text(
              " ....جاري التحميل",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Tajawal',
                color: Color(0xff0e3cb1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}