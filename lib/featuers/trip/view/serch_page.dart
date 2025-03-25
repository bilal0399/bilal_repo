import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/trip_controller.dart';
import '../servises/trip_servise.dart';

class SearchPage extends StatelessWidget {
  final TripController tripController = Get.find<TripController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xff1E293B),
          title:  Center(
            child: Text(
              'بحث عن رحلة',
              style: TextStyle(color: Colors.white, fontFamily: 'Tajawal'),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'اختر المدينة الذي أنت فيها :',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff1E293B),
                  fontFamily: 'Tajawal',
                ),
              ),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: tripController.fromCity.value,
                  onChanged: (value) => tripController.fromCity.value = value!,
                  items:
                  TripService.cities.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(
                            city,
                            style:  TextStyle(fontFamily: 'Tajawal'),
                          ),
                        );
                      }).toList(),
                  decoration:  InputDecoration(border: OutlineInputBorder()),
                ),
              ),
               SizedBox(height: 20),
               Text(
                'اختر المدينة التي تريد الذهاب إليها :',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff1E293B),
                  fontFamily: 'Tajawal',
                ),
              ),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: tripController.toCity.value,
                  onChanged: (value) => tripController.toCity.value = value!,
                  items:
                  TripService.cities.map((city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(
                            city,
                            style:  TextStyle(fontFamily: 'Tajawal'),
                          ),
                        );
                      }).toList(),
                  decoration:  InputDecoration(border: OutlineInputBorder()),
                ),
              ),
               SizedBox(height: 20),
               Text(
                'ادخل الوقت الذي تريد:',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff1E293B),
                  fontFamily: 'Tajawal',
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => tripController.selectTime(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xff1E293B),
                    ),
                    child:  Text(
                      'اختر الوقت',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ),
                   SizedBox(width: 10),
                  Obx(
                    () => Text(
                      tripController.selectedTime.value != null
                          ? '${tripController.selectedTime.value!.hour}:${tripController.selectedTime.value!.minute}'
                          : 'لم يتم اختيار وقت',
                      style:  TextStyle(
                        fontSize: 16,
                        color: Color(0xff334155),
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    tripController.performSearch();
      
                    if (tripController.searchResults.isEmpty) {
                      Get.snackbar(
                        "نتيجة البحث",
                        "لم يتم العثور على أي رحلة تطابق البحث",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 2),
                      );
                    } else {
                      tripController.currentIndex.value = 1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xff1E293B),
                    padding:  EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child:  Text(
                    'بحث',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
