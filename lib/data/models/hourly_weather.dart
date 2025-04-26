import 'package:flutter/widgets.dart';

class HourlyWeather {
  final String time;
  final int temp;
  final IconData icon;

  const HourlyWeather({
    required this.time,
    required this.temp,
    required this.icon,
  });
}
