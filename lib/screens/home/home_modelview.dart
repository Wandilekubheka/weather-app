import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/repository/location_repo.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';
import 'package:weather_app/domain/usecase/use_get_temperature.dart';
import 'package:weather_app/domain/usecase/use_last_location_name.dart';

class HomeModelview extends ChangeNotifier {
  String _locationName = "life mos";
  // WeatherTypes _weatherTypes = WeatherTypes.hot;
  final LocationRepo _locationRepo;
  final WeatherRepository _weatherRepository;
  Position? _position;
  double _temp = 0;
  String? _error;
  HomeModelview(this._locationRepo, this._weatherRepository);

  double get temp => _temp;

  Position get position {
    if (_position == null) {
      // random coords incase we fail to get coords
      return Position(0, 0);
    }
    return _position!;
  }

  String get cityName => _locationName;

  String? get error => _error;

  Future<void> updateLastLocationName() async {
    try {
      String? e =
          await Usegetlastlocationname(_locationRepo).getLastLocationName();
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

  Future<void> updateTemperature() async {
    try {
      _position = await _locationRepo.getUserLocation();
      UseGetTemperature temperature = UseGetTemperature(
        _locationName,
        weatherRepository: _weatherRepository,
      );
      _temp = await temperature.getTemperature();
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }
}
