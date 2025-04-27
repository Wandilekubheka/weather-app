import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/weather_types.dart';
import 'package:weather_app/domain/repository/weather.dart';

class HomeModelview extends ChangeNotifier {
  String? _locationName;
  WeatherTypes _weatherTypes = WeatherTypes.hot;
  final Weather _weather;

  HomeModelview(this._weather);

  Future<String> getLastLocationName() {
    return "";
  }
}
