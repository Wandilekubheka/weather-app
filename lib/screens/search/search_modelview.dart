import 'package:flutter/material.dart';

class SearchModelview extends ChangeNotifier {
  late String _cityName;
  String? _error;

  String? get error => _error;
  String get cityName => _cityName;

  void extractCityName(String placeId) {
    List<String> placeNameList = placeId.split(",");
    print("${placeNameList.length} asdasd");
    if (placeNameList.length < 3) {
      _error = "failed to get city Name";
      return;
    }
    _cityName = placeNameList[2];
    notifyListeners();
  }
}
