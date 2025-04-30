import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/repository/location_repo.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';
import 'package:weather_app/domain/usecase/use_last_location_name.dart';

class HomeModelview extends ChangeNotifier {
  String _locationName = "";
  // WeatherTypes _weatherTypes = WeatherTypes.hot;
  final LocationRepo _locationRepo;
  WeatherRepository _weatherRepository;
  Position? _position;
  WeatherResponse? _response;

  String? _error;
  HomeModelview(this._locationRepo, this._weatherRepository);

  WeatherResponse? get weatherInfo => _response;

  Position get position {
    if (_position == null) {
      // random coords incase we fail to get coords
      return Position(0, 0);
    }
    return _position!;
  }

  String get cityName => _locationName;

  String? get error => _error;

  Future<void> updateLastLocationName(String cityName) async {
    // incase city name is provided by a route
    if (cityName.isNotEmpty) {
      _locationName = cityName;
      return;
    }
    // attempt to get city name
    try {
      Position getPosition = await _locationRepo.getUserLocation();
      String? e = await Usegetlastlocationname().getCityNameFromCoords(
        getPosition,
      );
      if (e == null) {
        _locationName = "Connection Error";
        _error = "Connection Error";
      } else {
        _locationName = e;
      }
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  Future<void> updateWeatherInfo() async {
    try {
      _response = await _weatherRepository.getWeatherData(_locationName);
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }
}
