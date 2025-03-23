import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project2/featuers/trip/model/trip_model.dart';


import '../servises/trip_servise.dart';

class TripController extends GetxController {
  RxInt currentIndex = 1.obs;

  RxString fromCity = RxString('حلب');
  RxString toCity = RxString('دمشق');
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  //-------------------------------------------------------------------
  Rx<TripModel?> selectedTrip = Rx<TripModel?>(null);

  void selectTrip(TripModel trip) {
    selectedTrip.value = trip;
  }

  //-------------------------------------------------------------------

  var allTrips = TripServise.trips.obs;
  var searchResults = <TripModel>[].obs;
  RxBool isSearching = false.obs;

  void performSearch() {
    searchResults.value = searchTrips(fromCity.value, toCity.value, selectedTime.value?.hour ?? 0, selectedTime.value?.minute ?? 0);

    if (searchResults.isNotEmpty) {
      isSearching.value = true;
    } else {
      Get.snackbar('لا توجد رحلات', 'لم يتم العثور على أي رحلة', colorText: Colors.red);
      isSearching.value = false;
    }
  }


  void resetSearch() {
    isSearching.value = false;
    searchResults.clear();

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
  List<TripModel> searchTrips(String from, String to, int hour, int minute) {
    int userTimeInMinutes = (hour * 60) + minute;

    return TripServise.trips.where((trip) {
      int tripTimeInMinutes = (trip.time.hour * 60) + trip.time.minute;

      bool isTimeInRange = (tripTimeInMinutes >= userTimeInMinutes - 300 &&
          tripTimeInMinutes <= userTimeInMinutes + 300);


      return trip.city1.toLowerCase().contains(from.toLowerCase()) &&
          trip.city2.toLowerCase().contains(to.toLowerCase()) &&
          isTimeInRange;
    }).toList();
  }

  void bookSeat(int index) {
    if (index >= 0 && index < TripServise.trips.length) {
      var trip = TripServise.trips[index];
      if (trip.seats.value > 0) {
        trip.seats.value--;
      }
    }
  }
}



