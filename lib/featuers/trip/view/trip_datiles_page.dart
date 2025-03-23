import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/trip_controller.dart';
import '../model/trip_model.dart';
import '../servises/trip_servise.dart';

class TripDatilsPage extends StatelessWidget {
  TripDatilsPage({super.key});

  final TripController tripController = Get.find();

  @override
  Widget build(BuildContext context) {
    final TripModel? trip = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E293B),
        title:  Center(
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
          ? Center(child: Text('لا توجد تفاصيل للرحلة', style: TextStyle(fontFamily: 'Tajawal')))
          : Directionality(
        textDirection: TextDirection.rtl,
            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10))
                                ),
                                child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10)),

                                child: Image.asset('assets/images/travel.jpg'))),

                            Text('الرحلة ستنطلق من: ${trip.city1} إلى: ${trip.city2}',
                                style: TextStyle(fontFamily: 'Tajawal', fontSize: 22, color: Colors.grey[700],fontWeight:FontWeight.w700)),
                            Text('السائق: ${trip.driver}',
                                      style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xff1E293B))),
                            SizedBox(height: 10),

                            SizedBox(height: 10),
                            Text('الوقت: ${trip.time.hour}:${trip.time.minute.toString().padLeft(2, '0')}',
                                      style: TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: Color(0xff1E293B))),
                            Obx(
                             ()=> Text('المقاعد المتاحة: ${trip.seats}',
                                        style: TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: Colors.black)),
                            ),
                            Text('السعر: ${trip.price} ل.س',
                                      style: TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: Colors.redAccent)),
                            SizedBox(height: 20),
                            ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff1E293B),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                    ),
                                    onPressed: () {
                                      tripController.bookSeat(TripServise.trips.indexOf(trip));
                                      Get.snackbar('تم الحجز', 'تم حجز مقعدك بنجاح!',
                                          backgroundColor: Colors.green, colorText: Colors.white);
                                      Get.back();
                                    },
                                    child: Center(
                                      child: Text('احجز مقعدك',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                            ),
                          ],
                        ),

          ),
    );
  }
}
