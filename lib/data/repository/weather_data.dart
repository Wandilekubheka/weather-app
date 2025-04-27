import 'dart:convert';

import 'package:http/http.dart';

class WeatherData {
  final String apiKey = 'YOUR_API_KEY'; // replace with your API key
  final String baseUrl = 'https://api.weatherapi.com/v1';

  Future<Map<String, dynamic>> requestWeatherdData(String urlName) async {
    final url = Uri.parse(urlName);

    final response = await get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
