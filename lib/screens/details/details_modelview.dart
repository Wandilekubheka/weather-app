import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';

class DetailsModelview extends ChangeNotifier {
  final WeatherRepository _weatherRepository;
  WeatherResponse? _weatherResponse;
  String? _error;

  String? get error => _error;

  WeatherResponse? get weatherResponse => _weatherResponse;

  DetailsModelview({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  String getTodayDate() {
    return "";
  }

  Future<void> getWeatherData(String locationCity) async {
    try {
      _weatherResponse = await _weatherRepository.getWeatherData(locationCity);
    } catch (e) {
      _error = e.toString();
    }
    notifyListeners();
  }
}
