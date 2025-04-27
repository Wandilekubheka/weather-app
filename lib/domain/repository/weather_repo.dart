import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/repository/weather_data.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherRepository {
  final WeatherData _weatherData;
  WeatherRepository(this._weatherData);
  String _apiKey = "";
  // method for fetching weather data from from weather api
  Future<WeatherResponse> getWeatherData(Position position) async {
    String url =
        '${CConstants.weatherAPI}?lat=${position.latitude}&lon=${position.longitude}&appid=$_apiKey';
    try {
      String response = await _weatherData.requestWeatherdData(url);
      return WeatherResponse.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
