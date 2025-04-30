import 'package:flutter/material.dart';
import 'package:weather_app/data/models/hourly_weather.dart';
import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/utils/widgets/custom_scaffold.dart';

class DetailsScreen extends StatelessWidget {
  final String locationCity;

  const DetailsScreen({super.key, required this.locationCity});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 40,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.chevron_left),
                  Text("Back", style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  "Sep, 12",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget hourlyWeather(List<HourlyWeather> weatherData) {
    return Row(
      children: [
        ListView.builder(
          itemCount: weatherData.length,
          itemBuilder:
              (context, index) => Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            weatherData[index].time,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Image.asset(
                            "assets/images/cloudy.png",
                            width: 50,
                            height: 50,
                          ),

                          Text(
                            weatherData[index].time,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ],
    );
  }
}
