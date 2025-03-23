import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/trip_controller.dart';
import 'componants/drawar_componant.dart';
import 'componants/trips_listview_componant.dart';


class DisplayTripsPage extends StatelessWidget {
   DisplayTripsPage({super.key});
  final TripController tripController = Get.put(TripController());
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1E293B),
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed('/profile');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xff1E293B)),
                  ),
                ),
              ),
              SizedBox(width: 125,),
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
              IconButton(onPressed: (){
                tripController.resetSearch();
              }, icon: Icon(Icons.refresh)),
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 5,left: 20 ,right: 20),
                child: Text('الرحلات المتوفرة ',style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                  color:  Color(0xff1E293B),
                ),),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom:25,left: 20,right: 20),
            child: Text('اختر رحلة من بين الرحلات او ابحث من خلال ايقونة البحث في الأسفل',style: TextStyle(
              fontSize: 10,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w700,
              color:  Color(0xff1E293B),
            ),),
          ),
          Expanded(child:  TripsListviewComponant()),
        ],
            ),
      );
  }
}
