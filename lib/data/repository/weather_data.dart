import 'package:http/http.dart';

class WeatherData {
  Future<String> requestWeatherdData(String url) async {
    Response response = await get(Uri.parse(url));
    return response.body;
  }
}
