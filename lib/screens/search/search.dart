import 'package:flutter/material.dart';
import 'package:weather_app/data/models/history_data.dart';
import 'package:weather_app/screens/home/home.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/widgets/custom_scaffold.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // replace gradient background with actual map
    return Scaffold(
      backgroundColor: CColors.darkBlue,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),

              // color: CColors.smokeWhite,
            ),
            child: searchBar(),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    double height = MediaQuery.of(context).viewPadding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        color: CColors.smokeWhite,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height),
          SearchBar(
            hintStyle: WidgetStatePropertyAll(
              Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: CColors.lightGreyText),
            ),
            backgroundColor: WidgetStatePropertyAll(CColors.lightTextColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            hintText: "Search here",
            leading: GestureDetector(
              onTap:
                  () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    ),
                  },
              child: Icon(Icons.arrow_back, color: CColors.darkTextColor),
            ),
            trailing: [Icon(Icons.mic, color: CColors.darkTextColor)],
          ),

          Text("Recent Search", style: TextStyle(color: CColors.darkTextColor)),
          searchHistory(HistoryData(locationName: "roodeport", temp: 32)),
        ],
      ),
    );
  }

  Widget searchHistory(HistoryData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Icon(Icons.watch_later_outlined, color: CColors.darkTextColor),
            Text(
              data.locationName,
              style: TextStyle(
                color: CColors.darkTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          '${data.temp.toString()}°',
          style: TextStyle(color: CColors.darkTextColor),
        ),
      ],
    );
  }
}
