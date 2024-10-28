import 'package:flutter/material.dart';
import 'custom_icon.dart';

class RoundImage extends StatelessWidget {
  final double size;
  final String image;
  final double borderWidth;
  final Color color;

  const RoundImage(
      {super.key,
      required this.size,
      required this.image,
      required this.borderWidth,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3 * borderWidth),
      decoration: BoxDecoration(
          border: Border.all(width: borderWidth, color: color),
          borderRadius: BorderRadius.circular(300)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: CustomIcon(iconName: image, height: size)),
    );
  }
}
