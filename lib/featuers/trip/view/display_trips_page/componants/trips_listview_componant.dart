import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controllers/trip_controller.dart';
import '../../../model/trip_model.dart';
import '../../../servises/trip_servise.dart';

class TripsListviewComponant extends StatelessWidget {
  TripsListviewComponant({super.key});
  final TripController tripController = Get.put(TripController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<TripModel>>(
        future: Future.delayed(const Duration(milliseconds: 200), () => TripService.trips),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F5F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          radius: 25,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: 16, color: Colors.grey[400]),
                              const SizedBox(height: 5),
                              Container(height: 16, color: Colors.grey[400]),
                              const SizedBox(height: 5),
                              Container(height: 14, width: 100, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final List<TripModel> trips = tripController.isSearching.value
                ? tripController.searchResults
                : snapshot.data!;
            return ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return InkWell(
                  onTap: () async {
                    tripController.selectTrip(trip);
                    final result = await Get.toNamed('/datiles', arguments: trip);
                    if (result == true) {
                      tripController.update();
                    }
                  },
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            offset: Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        // border: Border.all(color: Color(0xff8da5df), width: 1),
                      ),
                      child: Row(
                        children: [
                          // الجزء الأول: الصورة الجانبية

                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // العنوان (حلب - دمشق)
                                Text(
                                  '${trip.city1} - ${trip.city2}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff0F172A),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal',
                                  ),
                                ),

                                // التاريخ
                                Text(
                                  ' ${tripController.getWeekdayName(trip.date.weekday)} ${trip.date.day} ${tripController.getMonthName(trip.date.month)} ${trip.date.year}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueAccent,
                                    fontFamily: 'Tajawal',
                                  ),
                                ),

                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 18, color: Colors.grey),
                                    SizedBox(width: 5,),
                                    Text(
                                      '${trip.time.hour}:${trip.time.minute.toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[600],
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    SizedBox(width: 40,),

                                    Obx(() => Text(
                                      ' ${trip.seats} مقعد متاح ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        // color: Color(0xffb80634),
                                        fontFamily: 'Tajawal',
                                      ),
                                    )),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Icon(Icons.edit_road_outlined, size: 18, color: Colors.grey),
                                    SizedBox(width: 5,),
                                    Text(
                                      '${trip.distance}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                   SizedBox(width: 20,),
                                    Icon(Icons.attach_money, size: 18, color: Colors.grey),
                                    SizedBox(width: 5,),
                                    Text(
                                      '${trip.price} ل.س',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),

                                  ],
                                ),

                                // المقاعد المتاحة

                              ],
                            ),
                          ),
                          SizedBox(width: 15), // فاصل بين الصورة والتفاص// يل
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: trip.imgLink2 == null || trip.imgLink2.isEmpty
                                  ? Icon(
                                Icons.image_not_supported_outlined,
                                size: 60,
                                color: Colors.grey,
                              )
                                  : Image.asset(
                                trip.imgLink2, // استبدالها بالرابط الفعلي للصورة
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                                errorBuilder: (context, object, stackTrace) {
                                  return Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 60,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),

                          // الجزء الثاني: التفاصيل

                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return  Center(child: Text('لا يوجد بيانات'));
          }
        },
      ),
    );
  }
}
