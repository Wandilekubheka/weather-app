import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/repository/weather_data.dart';
import 'package:weather_app/domain/repository/emp_location_repo.dart';
import 'package:weather_app/domain/repository/location_repo.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';
import 'package:weather_app/screens/home/home.dart';
import 'package:weather_app/screens/home/home_modelview.dart';
import 'package:weather_app/utils/theme.dart';

void main() {
  WeatherData weatherData = WeatherData();
  LocationRepo locationRepo = EmpLocationRepo();
  WeatherRepository weatherRepository = WeatherRepository(weatherData);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeModelview(locationRepo, weatherRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Ctheme.cThemedata,
      home: const HomeScreen(),
    );
  }
}
