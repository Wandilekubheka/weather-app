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
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [CColors.lightBlue, CColors.darkBlue],
      ),
      body: SafeArea(child: widget.child),
    );
  }
}
