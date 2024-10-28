import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final double height;
  final String iconName;
  const CustomIcon({super.key, required this.height, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, child: Image.asset(iconName));
  }
}
