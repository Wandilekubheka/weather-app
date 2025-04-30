import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/repository/weather_data.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherRepository {
  final WeatherData _weatherData;
  const WeatherRepository(this._weatherData);
  final String _apiKey = "57246ccb51f54769915123238252704";
  // method for fetching weather data from from weather api
  Future<WeatherResponse> getWeatherData(String cityName) async {
    final String baseUrl = CConstants.weatherAPI;

    final String url = '$baseUrl?key=$_apiKey&q=$cityName';
    try {
      Map<String, dynamic> response = await _weatherData.requestWeatherdData(
        url,
      );
      return WeatherResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
