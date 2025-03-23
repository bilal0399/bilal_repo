import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripModel {
  String city1;
  String city2;
  String driver;
  TimeOfDay time;
  int price;
  String imgLink;
  RxInt seats;

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
  })  : time = TimeOfDay(hour: hour, minute: minute),
        seats = seats.obs;
}

