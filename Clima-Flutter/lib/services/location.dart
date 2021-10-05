import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position pos = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = pos.latitude;
      longitude = pos.longitude;
    } catch (e) {
      print(e);
    }
  }
}
