import 'package:final_project2/featuers/trip/model/trip_model.dart';
import 'package:get/get.dart';

class TripServise {
  static List<TripModel> trips = [
    TripModel(seats: 10, city1: 'اعزاز', city2: 'إدلب', driver: 'سفريات النور', hour: 5, minute: 30, price: 50000, imgLink: ''),
    TripModel(seats: 8, city1: 'دمشق', city2: 'حمص', driver: 'أبو محمد', hour: 9, minute: 15, price: 40000, imgLink: ''),
    TripModel(seats: 8, city1: 'دمشق', city2: 'حمص', driver: 'سفريات المدية ', hour: 6, minute: 15, price: 40000, imgLink: ''),
    TripModel(seats: 12, city1: 'اللاذقية', city2: 'حلب', driver: 'رحلات الخير', hour: 13, minute: 45, price: 60000, imgLink: ''),
    TripModel(seats: 7, city1: 'حماة', city2: 'طرطوس', driver: 'أبو علي', hour: 8, minute: 20, price: 35000, imgLink: ''),
    TripModel(seats: 5, city1: 'الرقة', city2: 'دير الزور', driver: 'سفريات الهدى', hour: 15, minute: 0, price: 55000, imgLink: ''),
    TripModel(seats: 9, city1: 'دمشق', city2: 'تدمر', driver: 'أبو حسن', hour: 7, minute: 50, price: 45000, imgLink: ''),
    TripModel(seats: 11, city1: 'السويداء', city2: 'درعا', driver: 'سفريات الشام', hour: 6, minute: 10, price: 30000, imgLink: ''),
    TripModel(seats: 6, city1: 'إدلب', city2: 'حلب', driver: 'أبو محمود', hour: 10, minute: 25, price: 48000, imgLink: ''),
    TripModel(seats: 12, city1: 'حمص', city2: 'تدمر', driver: 'أبو خالد', hour: 10, minute: 25, price: 30000, imgLink: ''),

  ].obs;
  static List<String> cities = [
    'حلب', 'حمص', 'دمشق', 'إدلب', 'اللاذقية', 'درعا', 'دير الزور', 'تدمر', 'طرطوس', 'حماة'
  ];
}   