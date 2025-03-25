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
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xff8da5df), width: 1),
                      ),
                      child: Row(
                        children: [
                          // الجزء الأول: الصورة الجانبية
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
                          SizedBox(width: 15), // فاصل بين الصورة والتفاصيل

                          // الجزء الثاني: التفاصيل
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
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal',
                                  ),
                                ),

                                // التاريخ
                                Text(
                                 ' ${tripController.getWeekdayName(trip.date.weekday)} ${trip.date.day} ${tripController.getMonthName(trip.date.month)} ${trip.date.year}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'Tajawal',
                                  ),
                                ),

                                // وقت الانطلاق والوصول
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${trip.time.hour}:${trip.time.minute.toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    Icon(Icons.access_time, size: 18, color: Colors.grey),
                                    Text(
                                      '10:00', // استبدالها بالوقت الفعلي للوصول
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    Icon(Icons.access_time, size: 18, color: Colors.grey),
                                  ],
                                ),

                                // المسافة
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'km${trip.distance}', // استبدالها بالمسافة الفعلية
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    Icon(Icons.directions_car, size: 18, color: Colors.grey),
                                    Text(
                                      '\$${trip.price}', // استبدالها بالسعر الفعلي
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    Icon(Icons.attach_money, size: 18, color: Colors.grey),
                                  ],
                                ),

                                // المقاعد المتاحة
                                Obx(() => Text(
                                  'المقاعد المتاحة: ${trip.seats}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff0F172A),
                                    fontFamily: 'Tajawal',
                                  ),
                                )),
                              ],
                            ),
                          ),
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
