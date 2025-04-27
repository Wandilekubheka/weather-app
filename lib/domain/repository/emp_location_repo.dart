import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/models/position.dart' as user_location;
import 'package:weather_app/domain/repository/location_repo.dart';

class EmpLocationRepo implements LocationRepo {
  @override
  Future<void> getLocationPermission() async {
    // checks if service enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;
    if (!serviceEnabled) {
      return Future.error("Location service is disabled");
    }
    // requests for location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //incase location permission denied perm
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Please open settings to allow person");
    }
  }

  @override
  Future<user_location.Position> getUserLocation() async {
    // method for getting user location
    Position position = await Geolocator.getCurrentPosition();
    return user_location.Position(position.latitude, position.longitude);
  }
}
