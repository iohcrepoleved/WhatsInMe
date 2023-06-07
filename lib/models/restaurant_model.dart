import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  final String gubun, name, phoneNumber, address;
  final GeoPoint coordinate;

  RestaurantModel.fromJson(Map<String, dynamic> json)
      : gubun = json['gubun'],
        name = json['name'],
        coordinate = json['coordinate'],
        phoneNumber = json['phoneNumber'],
        address = json['address'];
}
