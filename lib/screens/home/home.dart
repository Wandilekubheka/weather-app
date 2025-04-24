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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headerBar(),

            GestureDetector(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: CColors.lightTextColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forecast report",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CColors.darkTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: CColors.darkTextColor),
                  ],
                ),
              ),
            ),
          ],
        ),
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
