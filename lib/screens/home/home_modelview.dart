import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/domain/repository/location_repo.dart';
import 'package:weather_app/domain/usecase/use_last_location_name.dart';

class HomeModelview extends ChangeNotifier {
  String? _locationName;
  // WeatherTypes _weatherTypes = WeatherTypes.hot;
  final LocationRepo _locationRepo;
  Position? _position;
  String? _error;
  HomeModelview(this._locationRepo);

  Future<void> updateLastLocationName() async {
    try {
      String? e =
          await Usegetlastlocationname(_locationRepo).getLastLocationName();
      if (e == null) {
        _locationName = "Connection Error";
        _error = "Connection Error";
      }
    } catch (e) {
      _error = e.toString();
    }
  }

  Future<void> updateTemperature() async {
    try {
      _position = await _locationRepo.getUserLocation();
    } catch (e) {
      _error = e.toString();
    }
  }
}
