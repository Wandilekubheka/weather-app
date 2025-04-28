import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:weather_app/data/models/history_data.dart';
import 'package:weather_app/data/models/position.dart';
import 'package:weather_app/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  final Position position;
  const SearchScreen({super.key, required this.position});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // replace gradient background with actual map
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.smokeWhite,
        leading: Text(""),
        titleSpacing: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              zoom: 20,
              target: LatLng(
                widget.position.latitude,
                widget.position.longitude,
              ),
            ),
          ),
          Column(
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
        ],
      ),
    );
  }

  Widget search2() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(),
      ),
      child: Row(
        spacing: 10,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: CColors.darkTextColor),
          ),
          Expanded(
            child: GooglePlacesAutoCompleteTextFormField(
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: CColors.darkTextColor),
              textEditingController: _textController,
              googleAPIKey: "AIzaSyDFUnbDx_fl3ha9993Py_wzuVMs9N8UZ1E",
              decoration: InputDecoration(
                hintText: 'Search here',
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: CColors.lightGreyText),
                border: InputBorder.none,
              ),
            ),
          ),

          GestureDetector(child: Icon(Icons.mic, color: CColors.darkTextColor)),
        ],
      ),
    );
  }

  Widget searchBar() {
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
          search2(),
          if (_textController.text == "")
            searchHistory(HistoryData(locationName: "roodeport", temp: 32)),
        ],
      ),
    );
  }

  Widget searchHistory(HistoryData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text("Recent Search", style: TextStyle(color: CColors.darkTextColor)),

        Row(
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
        ),
      ],
    );
  }
}
