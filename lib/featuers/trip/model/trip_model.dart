import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripModel {
  String city1;
  String city2;
  String driver;
  TimeOfDay time;
  DateTime date;
  String imgLink2;
  int price;
  String imgLink;
  RxInt seats;
  String distance;
  double startLat;
  double startLng;
  double endLat;
  double endLng;

  // Constructor
  TripModel({
    required int seats,
    required this.city2,
    required this.city1,
    required this.driver,
    required int hour,
    required int minute,
    required this.price,
    required this.imgLink,
    required this.date,
    required this.imgLink2,
    required this.distance,
    required this.startLat,
    required this.startLng,
    required this.endLat,
    required this.endLng,
  })  : time = TimeOfDay(hour: hour, minute: minute),
        seats = seats.obs;
}
