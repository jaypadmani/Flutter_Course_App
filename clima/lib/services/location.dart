import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude1;
  late double latitude1;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude1 = position.latitude;
      longitude1 = position.longitude;

    } catch (e) {
      print(e);
    }
  }
}
