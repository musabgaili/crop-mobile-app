import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ZoneContainer extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  const ZoneContainer(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            color: color,
            height: 50,
            width: 120,
            padding: const EdgeInsets.all(10),
            child: Center(
                child: Text(text,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.w700)))));
  }
}

class ZoneArrow extends StatelessWidget {
  final Color color;
  final Color iconColor;

  const ZoneArrow({super.key, required this.color, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            color: color,
            height: 50,
            width: 120,
            child: Center(child: Icon(Icons.arrow_forward, color: iconColor))));
  }
}

class ZoneList extends StatelessWidget {
  const ZoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ZoneContainer(
                  color: mainColor, text: 'Zone 1', textColor: Colors.black),
              const SizedBox(width: 15),
              ZoneContainer(
                  color: mainColor, text: 'Zone 2', textColor: Colors.black),
              const SizedBox(width: 15),
              ZoneContainer(
                  color: mainColor, text: 'Zone 3', textColor: Colors.black),
              const SizedBox(width: 15),
              ZoneArrow(color: contrastColor, iconColor: Colors.white),
            ],
          )),
    );
  }
}
