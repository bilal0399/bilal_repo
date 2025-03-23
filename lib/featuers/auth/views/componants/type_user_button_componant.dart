import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeUserButtonComponant extends StatelessWidget {
  TypeUserButtonComponant({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    // تعريف الحالة الخاصة بكل زر بشكل مستقل
    final RxBool isTapped = false.obs;

    return Obx(
          () => InkWell(
        onTap: () {
          isTapped.value = !isTapped.value; // عكس الحالة عند الضغط
        },
        child: Container(
          height: 68,
          width: 342,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isTapped.value
                  ? const Color(0xff2563EB)
                  : const Color(0xff64748B),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isTapped.value
                  ? const Color(0xff2563EB)
                  : const Color(0xffE2E8F0),
            ),
          ),
        ),
      ),
    );
  }
}
