import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project2/featuers/trip/model/trip_model.dart';

import '../servises/trip_servise.dart';

class TripController extends GetxController {
  RxInt currentIndex = 1.obs;

  RxString fromCity = RxString('حلب');
  RxString toCity = RxString('دمشق');
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  //-------------------------------------------------------------------
  Rx<TripModel?> selectedTrip = Rx<TripModel?>(null);

  void selectTrip(TripModel trip) {
    selectedTrip.value = trip;
  }

  //-------------------------------------------------------------------

  var allTrips = TripService.trips.obs;
  var searchResults = <TripModel>[].obs;
  RxBool isSearching = false.obs;

  RxBool isBooked = false.obs;
  void performSearch() {

    if (fromCity.value.isEmpty || toCity.value.isEmpty || selectedDate.value == null || selectedTime.value == null) {
      Get.snackbar(
        'بيانات غير مكتملة',
        'يرجى إدخال جميع البيانات: المدينة المصدر، المدينة الهدف، التاريخ، والوقت.',
        colorText: Colors.red,
      );
      isSearching.value = false;
      return;
    }


    searchResults.value = TripService.searchTrips(
      fromCity.value,
      toCity.value,
      selectedDate.value! as DateTime ,
      selectedTime.value!.hour,
      selectedTime.value!.minute,
    ) as List<TripModel>;


    if (searchResults.isNotEmpty) {
      isSearching.value = true;
    } else {
      Get.snackbar(
        'لا توجد رحلات',
        'لم يتم العثور على أي رحلة تناسب معايير البحث.',
        colorText: Colors.red,
      );
      isSearching.value = false;
    }
  }

  void resetSearch() {
    isSearching.value = false;
    searchResults.clear();
    print('serch reset');
  }

  //-------------------------------------------------------------------

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      selectedTime.value = picked;
    }
  }

  void bookSeat(int index) {
    if (index >= 0 && index < TripService.trips.length) {
      var trip = TripService.trips[index];
      if (trip.seats.value > 0 && !isBooked.value) {
        trip.seats.value--;
        isBooked.value = true;
      }
    }
  }
  String getMonthName(int month) {
     var months = [
      'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return months[month - 1];
  }
  String getWeekdayName(int weekday) {
     var weekdays = [
      'الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس',
      'الجمعة', 'السبت', 'الأحد'
    ];
    return weekdays[weekday - 1];
  }
}
