import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';

class UseGetTemperature {
  final WeatherRepository _weatherRepository;
  final Position _position;


  const UseGetTemperature(this._position, {required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;


    Future<int> getTemperature()async{
      try{
        await _weatherRepository.getWeatherData(long, lat)
      }
    }
}
