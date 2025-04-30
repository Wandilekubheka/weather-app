import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home/home_modelview.dart';
import 'package:weather_app/screens/search/search.dart';
import 'package:weather_app/utils/widgets/custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  final String cityName;
  const HomeScreen({super.key, this.cityName = ""});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeModelview>().updateLastLocationName(widget.cityName).then((
      onValue,
    ) {
      context.read<HomeModelview>().updateWeatherInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [headerBar(), mainContent()],
        ),
      ),
    );
  }

  Widget mainContent() {
    final weatherInfo = context.watch<HomeModelview>().weatherInfo;
    double width = MediaQuery.sizeOf(context).width;
    if (weatherInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Center(
      child: Column(
        children: [
          // going to reuse icon since we dont have more weather Icons.
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
                  weatherInfo.location.tzId,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  weatherInfo.current.tempC.toString(),

                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text("Cloudy", style: Theme.of(context).textTheme.bodyLarge),
                weatherStatesRow(
                  Icons.wind_power_outlined,
                  "Wind",
                  weatherInfo.current.windKph.toString(),
                ),
                weatherStatesRow(
                  Icons.cloud,
                  "Hum",
                  weatherInfo.current.humidity.toString(),
                ),
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
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => SearchScreen(
                      position: context.watch<HomeModelview>().position,
                    ),
              ),
            );
          },
          child: Row(
            spacing: 10,
            children: [
              Icon(Icons.location_on_outlined),
              Text(
                context.watch<HomeModelview>().cityName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        //show notification
        GestureDetector(onTap: () {}, child: Icon(Icons.notifications_active)),
      ],
    );
  }
}
