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
        future: Future.delayed(const Duration(milliseconds: 200), () => TripServise.trips),
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

                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xff8da5df), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: const Color(0xff1E293B),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                '${trip.time.hour}:${trip.time.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  trip.driver,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Tajawal',
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(trip.imgLink),
                                  radius: 25.r,
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              color: Color(0xff334155),
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                            children: [
                              const TextSpan(text: 'رحلة من '),
                              TextSpan(
                                text: '  ${trip.city1}   ',
                                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(text: ' إلى '),
                              TextSpan(
                                text: '   ${trip.city2}',
                                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${trip.price} ل.س',
                              style: const TextStyle(
                                  color: Color(0xff0F172A), fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Tajawal'),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.8, color: const Color(0xff0F172A)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Obx(() =>
                                  Text(
                                    'المقاعد المتاحة ${trip.seats} ',
                                    style: const TextStyle(color: Color(0xff0F172A), fontSize: 17, fontFamily: 'Tajawal'),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('لا يوجد بيانات'));
          }
        },
      ),
    );
  }
}
