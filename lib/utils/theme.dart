import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class Ctheme {
  static ThemeData cThemedata = ThemeData(
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: CColors.lightTextColor,
        fontSize: 14,
        fontFamily: "Overpass",
      ),
      titleLarge: TextStyle(
        color: CColors.lightTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: "Overpass",
        fontSize: 70,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontFamily: "Overpass",
        fontWeight: FontWeight.bold,
        color: CColors.lightTextColor,
      ),
    ),
    iconTheme: IconThemeData(size: 30, color: CColors.lightTextColor),
  );
}
