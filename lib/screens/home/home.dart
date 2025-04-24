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
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [headerBar()]),
      ),
    );
  }

  Widget headerBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        GestureDetector(
          // navivate to search screen
          onTap: () {},
          child: Row(
            spacing: 10,
            children: [
              Icon(Icons.location_on_outlined),
              Text("Roodepoort", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
        //show notification
        GestureDetector(onTap: () {}, child: Icon(Icons.notifications_active)),
      ],
    );
  }
}
