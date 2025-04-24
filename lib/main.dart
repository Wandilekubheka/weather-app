import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home.dart';
import 'package:weather_app/utils/theme.dart';

void main() {
  runApp(const MyApp());
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
