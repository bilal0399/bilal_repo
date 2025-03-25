import 'package:final_project2/featuers/trip/model/trip_model.dart';
import 'package:get/get.dart';

class TripService {
  static List<TripModel> trips = [
    TripModel(
      seats: 10,
      city1: 'اعزاز',
      city2: 'إدلب',
      driver: 'سفريات النور',
      hour: 5,
      minute: 30,
      price: 50000,
      imgLink: '', // صورة اعزاز (يمكن إضافتها لاحقًا)
      imgLink2: 'assets/images/idlip.png', // صورة إدلب
      date: DateTime.now().add(Duration(days: 1)),
      distance: '100 km',
      startLat: 36.585, startLng: 37.049,
      endLat: 35.930, endLng: 36.633,
    ),
    TripModel(
      seats: 3,
      city1: 'دمشق',
      city2: 'حمص',
      driver: 'أبو محمد',
      hour: 9,
      minute: 15,
      price: 40000,
      imgLink: '', // صورة دمشق
      imgLink2: 'assets/images/homs.png', // صورة حمص
      date: DateTime.now().add(Duration(days: 2)),
      distance: '150 km',
      startLat: 33.513, startLng: 36.276,
      endLat: 34.732, endLng: 36.713,
    ),
    TripModel(
      seats: 8,
      city1: 'دمشق',
      city2: 'حمص',
      driver: 'سفريات المدية',
      hour: 6,
      minute: 15,
      price: 40000,
      imgLink: '', // صورة دمشق
      imgLink2: 'assets/images/homs.png', // صورة حمص
      date: DateTime.now().add(Duration(days: 4)),
      distance: '150 km',
      startLat: 33.513, startLng: 36.276,
      endLat: 34.732, endLng: 36.713,
    ),
    TripModel(
      seats: 12,
      city1: 'اللاذقية',
      city2: 'حلب',
      driver: 'رحلات الخير',
      hour: 13,
      minute: 45,
      price: 60000,
      imgLink: '', // صورة اللاذقية
      imgLink2: 'assets/images/alippo.png', // صورة حلب
      date: DateTime.now().add(Duration(days: 6)),
      distance: '170 km',
      startLat: 35.517, startLng: 35.781,
      endLat: 36.202, endLng: 37.134,
    ),
    TripModel(
      seats: 7,
      city1: 'حلب',
      city2: 'دمشق',
      driver: 'السائق أحمد',
      hour: 14,
      minute: 0,
      price: 70000,
      imgLink: '', // صورة حلب
      imgLink2: 'assets/images/damascus.png', // صورة دمشق
      date: DateTime.now().add(Duration(days: 3)),
      distance: '310 km',
      startLat: 36.202, startLng: 37.134,
      endLat: 33.513, endLng: 36.276,
    ),
    TripModel(
      seats: 5,
      city1: 'طرطوس',
      city2: 'دمشق',
      driver: 'أبو علي',
      hour: 10,
      minute: 20,
      price: 45000,
      imgLink: '', // صورة طرطوس
      imgLink2: 'assets/images/damascus.png', // صورة دمشق
      date: DateTime.now().add(Duration(days: 5)),
      distance: '220 km',
      startLat: 34.889, startLng: 35.886,
      endLat: 33.513, endLng: 36.276,
    ),
    TripModel(
      seats: 6,
      city1: 'حمص',
      city2: 'حلب',
      driver: 'رحلات البركة',
      hour: 7,
      minute: 45,
      price: 55000,
      imgLink: '', // صورة حمص
      imgLink2: 'assets/images/alippo.png', // صورة حلب
      date: DateTime.now().add(Duration(days: 7)),
      distance: '180 km',
      startLat: 34.732, startLng: 36.713,
      endLat: 36.202, endLng: 37.134,
    ),
    TripModel(
      seats: 4,
      city1: 'إدلب',
      city2: 'اللاذقية',
      driver: 'أبو وسام',
      hour: 8,
      minute: 0,
      price: 50000,
      imgLink: '', // صورة إدلب
      imgLink2: 'assets/images/latakia.png', // صورة اللاذقية
      date: DateTime.now().add(Duration(days: 8)),
      distance: '130 km',
      startLat: 35.930, startLng: 36.633,
      endLat: 35.517, endLng: 35.781,
    ),
    TripModel(
      seats: 5,
      city1: 'درعا',
      city2: 'دمشق',
      driver: 'رحلات الجنوب',
      hour: 6,
      minute: 30,
      price: 38000,
      imgLink: '', // صورة درعا
      imgLink2: 'assets/images/damascus.png', // صورة دمشق
      date: DateTime.now().add(Duration(days: 10)),
      distance: '120 km',
      startLat: 32.625, startLng: 36.105,
      endLat: 33.513, endLng: 36.276,
    ),
    TripModel(
      seats: 10,
      city1: 'تدمر',
      city2: 'حمص',
      driver: 'رحلات الصحراوية',
      hour: 15,
      minute: 45,
      price: 60000,
      imgLink: '', // صورة تدمر
      imgLink2: 'assets/images/homs.png', // صورة حمص
      date: DateTime.now().add(Duration(days: 11)),
      distance: '160 km',
      startLat: 34.563, startLng: 38.277,
      endLat: 34.732, endLng: 36.713,
    ),
  ].obs;


  static List<String> cities = [
    'حلب',
    'حمص',
    'دمشق',
    'إدلب',
    'اللاذقية',
    'درعا',
    'دير الزور',
    'تدمر',
    'طرطوس',
    'حماة',
    'منبج',
    'القامشلي',
    'الحسكة',
    'الرقة',
    'بانياس',
    'السويداء',
    'اعزاز'
  ];
  static List<TripModel> searchTrips(String from, String to, DateTime userDate, int hour, int minute) {
    // تحويل الوقت المدخل إلى دقائق
    int userTimeInMinutes = (hour * 60) + minute;

    // تحديد نطاق التاريخ (اليوم السابق واليوم التالي)
    DateTime previousDay = userDate.subtract(Duration(days: 1));
    DateTime nextDay = userDate.add(Duration(days: 1));

    return TripService.trips.where((trip) {
      // تحويل وقت الرحلة إلى دقائق
      int tripTimeInMinutes = (trip.time.hour * 60) + trip.time.minute;

      // التحقق مما إذا كان الوقت يقع ضمن النطاق ±5 ساعات
      bool isTimeInRange = (tripTimeInMinutes >= userTimeInMinutes - 300 &&
          tripTimeInMinutes <= userTimeInMinutes + 300);

      // التحقق مما إذا كان التاريخ يقع ضمن النطاق (اليوم السابق أو نفس اليوم أو اليوم التالي)
      bool isDateInRange = (trip.date.isAfter(previousDay) || trip.date.isAtSameMomentAs(previousDay)) &&
          (trip.date.isBefore(nextDay) || trip.date.isAtSameMomentAs(nextDay));

      // التحقق من المدن ونطاق الوقت والتاريخ
      return trip.city1.toLowerCase().contains(from.toLowerCase()) &&
          trip.city2.toLowerCase().contains(to.toLowerCase()) &&
          isTimeInRange &&
          isDateInRange;
    }).toList();
  }
}
