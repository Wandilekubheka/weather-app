import 'package:weather_app/data/models/position.dart';

abstract class LocationRepo {
  Future<Position> getUserLocation();
  Future<bool> userAllowedLocation();
  Future<bool> getLocationPermission();
}
