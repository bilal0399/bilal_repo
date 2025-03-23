import 'package:final_project2/featuers/trip/controllers/trip_controller.dart';
import 'package:get/get.dart';

class TripBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TripController>(() => TripController());
  }

}