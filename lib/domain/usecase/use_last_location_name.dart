import 'package:geocoding/geocoding.dart';
import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/domain/repository/location_repo.dart';

class Usegetlastlocationname {
  final LocationRepo _locationRepo;
  Position? _position;
  Usegetlastlocationname(this._locationRepo);

  Future<String?> getLastLocationName() async {
    // method for getting location name
    try {
      // verify if user allowed location
      await _locationRepo.getLocationPermission();

      // get position object
      _position = await _locationRepo.getUserLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _position!.latitude,
        _position!.longitude,
      );
      //return city name
      return placemarks[0].locality;
    } catch (err) {
      // attempt to use last location form database
      rethrow;
    }
  }
}
