import 'package:flutter/material.dart';

class IconCustomized extends StatelessWidget {
  final double height;
  final String iconName;
  const IconCustomized(
      {super.key, required this.height, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(iconName),
    );
  }
}
