import 'package:geocoding/geocoding.dart';
import 'package:weather_app/data/models/position.dart';

class Usegetlastlocationname {
  Future<String?> getCityNameFromCoords(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      //return city name
      return placemarks[0].locality;
    } catch (err) {
      // attempt to use last location form database
      rethrow;
    }
  }
}
