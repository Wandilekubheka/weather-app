import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';

class UseGetTemperature {
  final WeatherRepository _weatherRepository;
  final String _cityName;

  const UseGetTemperature(
    this._cityName, {
    required WeatherRepository weatherRepository,
  }) : _weatherRepository = weatherRepository;

  Future<double> getTemperature() async {
    try {
      WeatherResponse response = await _weatherRepository.getWeatherData(
        _cityName,
      );
      return response.current.tempC;
    } catch (e) {
      // render prev temps from datebase
      rethrow;
    }
  }
}
