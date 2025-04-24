import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/widgets/custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(child: Center(child: Text("data")));
  }
}
