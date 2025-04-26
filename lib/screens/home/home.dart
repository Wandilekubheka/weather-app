import 'package:flutter/material.dart';
import 'package:weather_app/screens/search/search.dart';
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
            mainContent(),

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

  Widget mainContent() {
    double width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/cloudy.png", width: 350, height: 150),
          Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "Today, 12 September",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("29", style: Theme.of(context).textTheme.titleLarge),
                Text("Cloudy", style: Theme.of(context).textTheme.bodyLarge),
                weatherStatesRow(Icons.wind_power_outlined, "Wind", 'sometext'),
                weatherStatesRow(Icons.cloud, "Hum", 'sometext'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget weatherStatesRow(
    IconData leftIcon,
    String leftText,
    String rightText,
  ) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(leftIcon), Text("$leftText    |    $rightText")],
    );
  }

  Widget headerBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        GestureDetector(
          // navivate to search screen
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SearchScreen()),
            );
          },
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
