import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/trip_controller.dart';
import '../drawar_componant.dart';
import 'componants/trips_listview_componant.dart';

class DisplayTripsPage extends StatelessWidget {
  final TripController tripController = Get.put(TripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E293B),
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            SizedBox(width: 125),
            Text(
              'الصفحة الرئيسية',
              style: TextStyle(color: Colors.white, fontFamily: 'Tajawal'),
            ),
          ],
        ),
      ),
      endDrawer: DrawarComponant(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  tripController.resetSearch();
                },
                icon: Icon(Icons.refresh, color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                child: Text(
                  'الرحلات المتوفرة',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1E293B),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 25, left: 20, right: 20),
            child: Text(
              'اختر رحلة من بين الرحلات أو ابحث من خلال أيقونة البحث في الأسفل',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
                color: Color(0xff1E293B),
              ),
            ),
          ),
          // Trips List
          Expanded(
            child: Obx(() {
              if (tripController.isSearching.value && tripController.searchResults.isNotEmpty) {

                return TripsListviewComponant( );
              } else {

                return TripsListviewComponant();
              }
            }),
          ),
        ],
      ),
    );
  }
}