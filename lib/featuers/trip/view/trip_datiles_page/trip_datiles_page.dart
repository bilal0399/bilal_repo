import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/trip_controller.dart';
import '../../model/trip_model.dart';

class TripDatilsPage extends StatelessWidget {
  TripDatilsPage({super.key});

  final TripController tripController = Get.find();


  @override
  Widget build(BuildContext context) {
    final TripModel? trip = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff1E293B),
        title: Center(
          child: Text(
            'تفاصيل الرحلة',
            style: TextStyle(
              fontFamily: 'Tajawal',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: trip == null
          ? Center(
          child: Text('لا توجد تفاصيل للرحلة',
              style: TextStyle(fontFamily: 'Tajawal')))
          : Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20)),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(trip.startLat, trip.startLng),
                    initialZoom: 8.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 101,
                          height: 40,
                          point: LatLng(trip.startLat, trip.startLng),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 3),
                                  Text(
                                    trip.city1,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1E293B),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.my_location_outlined, color: Colors.green, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Marker(
                          width: 101,
                          height: 40,
                          point: LatLng(trip.endLat, trip.endLng),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 3),
                                  Text(
                                    trip.city2,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1E293B),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.location_on_outlined, color: Colors.green, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: [
                            LatLng(trip.startLat, trip.startLng),
                            LatLng(trip.endLat, trip.endLng),
                          ],
                          strokeWidth: 4.0,
                          color: Colors.orangeAccent.withOpacity(0.7),
                          strokeCap: StrokeCap.round,
                          pattern: StrokePattern.dashed( segments: [15,10]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 292,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding:EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(50),
                ),
                                child: Icon(Icons.my_location, color: Color(0xff0EA5E9))),
                            Text(
                              trip.city1,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1E293B),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Color(0xff0EA5E9), width: 2, style: BorderStyle.values[1]),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                                padding:EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(Icons.location_on, color: Color(0xff0EA5E9))),
                            Text(
                              trip.city2,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1E293B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    Divider(color: Colors.grey[300]),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${tripController.getWeekdayName(trip.date.weekday)} ${trip.date.day} ${tripController.getMonthName(trip.date.month)} ${trip.date.year}',
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "ذهاب",
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 17,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.attach_money_outlined, color: Colors.grey, size: 20),
                        SizedBox(width: 3),
                        Text(
                          '${trip.price} ل.س',
                          style: TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: Colors.grey[700]),
                        ),
                        SizedBox(width: 25.w,),
                        Icon(Icons.access_time_filled_rounded, color: Colors.grey, size: 20),
                        SizedBox(width: 3),
                        Text(
                          '${trip.time.hour}:${trip.time.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color:  Colors.grey[700]
                          ),
                        ),
                        SizedBox(width:25.w,),
                        Icon(Icons.add_road,color: Colors.grey,),
                        SizedBox(width: 3,),
                        Text(
                          '${trip.distance}',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color:  Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Obx(
                            ()=> Text(
                              '${trip.seats.value} مقعد متاح',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Colors.black,

                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${trip.driver}',
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  color: Colors.black,

                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                  ],
                ),

              ),
            ),
            Positioned(
              top:600,
              left: 50,
              right: 50,
              child: InkWell(
                onTap: () {
                  if (tripController.isBooked.value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('لقد قمت بالحجز مسبقًا',
                            style: TextStyle(fontFamily: 'Tajawal', color: Colors.white)),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }

                  if (trip.seats == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('المقاعد انتهت',
                            style: TextStyle(fontFamily: 'Tajawal', color: Colors.white)),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.orangeAccent,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }

                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 50),
                            SizedBox(height: 10),
                            Text('تأكيد الحجز',
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            SizedBox(height: 10),
                            Text(
                              'هل أنت متأكد من الحجز؟\n(إذا قمت بالحجز لا يمكن التراجع)',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Tajawal', fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey[300],
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10)),
                                  child: Text('إلغاء',
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    tripController.isBooked.value = true;
                                    trip.seats -= 1; // ينقص عدد المقاعد
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('تم الحجز بنجاح!',
                                            style: TextStyle(
                                                fontFamily: 'Tajawal', color: Colors.white)),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff1E293B),
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                                  child: Text('نعم',
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'حجز الآن',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  decoration: BoxDecoration(
                    color: Color(0xff1E293B),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
