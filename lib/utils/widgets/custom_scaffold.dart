import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:weather_app/utils/colors.dart';

class CustomScaffold extends StatefulWidget {
  final Widget child;
  const CustomScaffold({super.key, required this.child});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[CColors.lightBlue, CColors.darkBlue],
          tileMode: TileMode.mirror,
        ),
      ),
      child: SafeArea(child: widget.child),
    );
  }
}
