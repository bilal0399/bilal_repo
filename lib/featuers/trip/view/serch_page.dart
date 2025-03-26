import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/trip_controller.dart';
import '../servises/trip_servise.dart';
import 'drawar_componant.dart';

class SearchPage extends StatelessWidget {
  final TripController tripController = Get.find();

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: DrawarComponant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff1E293B),
          title: Center(
            child: Text(
              'بحث عن رحلة',
              style: TextStyle(color: Colors.white, fontFamily: 'Tajawal'),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image at the top
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    'assets/images/serch.png',
                  ),
                ),
                SizedBox(height: 30),

                // From City
                Text(
                  'اختر المدينة التي أنت فيها:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1E293B),
                    fontFamily: 'Tajawal',
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                      () => DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    value: tripController.fromCity.value,
                    onChanged: (value) => tripController.fromCity.value = value!,
                    items: TripService.cities.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(
                          city,
                          style: TextStyle(fontFamily: 'Tajawal'),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'المدينة المصدر',
                      labelStyle: TextStyle(fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // To City
                Text(
                  'اختر المدينة التي تريد الذهاب إليها:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1E293B),
                    fontFamily: 'Tajawal',
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                      () => DropdownButtonFormField<String>(
                    value: tripController.toCity.value,
                    onChanged: (value) => tripController.toCity.value = value!,
                    items: TripService.cities.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(
                          city,
                          style: TextStyle(fontFamily: 'Tajawal'),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'المدينة الهدف',
                      labelStyle: TextStyle(fontFamily: 'Tajawal'),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Time and Date Selection
                Text(
                  'ادخل الوقت والتاريخ:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1E293B),
                    fontFamily: 'Tajawal',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Select Time Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => tripController.selectTime(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff8eabe1),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'اختر الوقت',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          );
                          if (pickedDate != null) {
                            tripController.selectedDate.value = pickedDate;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff8eabe1),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'اختر التاريخ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                          () => Text(
                        tripController.selectedTime.value != null
                            ? 'الوقت: ${tripController.selectedTime.value!.hour}:${tripController.selectedTime.value!.minute}'
                            : 'لم يتم اختيار وقت',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff334155),
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                    // Display Selected Date
                    Obx(
                          () => Text(
                        tripController.selectedDate.value != null
                            ? 'التاريخ: ${formatDate(tripController.selectedDate.value!)}'
                            : 'لم يتم اختيار تاريخ',
                        style: TextStyle(
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
                      backgroundColor: Color(0xff1E293B),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: Text(
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
      ),
    );
  }
}