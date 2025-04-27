import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';

class UseGetTemperature {
  final WeatherRepository _weatherRepository;
  final Position _position;

  const UseGetTemperature(
    this._position, {
    required WeatherRepository weatherRepository,
  }) : _weatherRepository = weatherRepository;

  Future<double> getTemperature() async {
    try {
      WeatherResponse response = await _weatherRepository.getWeatherData(
        _position,
      );
      return response.current.temp;
    } catch (e) {
      // render prev temps from datebase
      rethrow;
    }
  }
}
