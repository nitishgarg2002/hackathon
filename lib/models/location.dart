import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
class Location with ChangeNotifier{
  final double latitude;
  final double longitude;
  Location({@required this.latitude,@required this.longitude});
}
