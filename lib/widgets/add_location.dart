import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

  Future<Location> addLocation(Location location) async{
    String username = 'admin';
  String password = 'admin';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);
    final url='https://women-app.herokuapp.com/api/';
    
      final response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
          'accept': 'application/json',
          'authorization':  basicAuth,
        },
        body: json.encode({
          'area':'delhi',
          'zone':'red',
          'latitude':location.latitude,
          'longitude':location.longitude,
          
        })
      );
      print(response.body);
      if(response.statusCode < 200 || response.statusCode > 400 || json == null){
        throw Exception('Failed to load Location');
        
      }
      else {
        return Location.fromJson(jsonDecode(response.body));
        
      }
    }
  

class Location {
  
  final double latitude;
  final double longitude;
  Location({ @required this.latitude,@required this.longitude});
  factory Location.fromJson(Map<String,dynamic> json){
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  
  }
   
}
