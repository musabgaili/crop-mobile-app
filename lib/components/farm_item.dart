import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class FarmItem extends StatelessWidget {
  final void Function() onTap;
  final String name;
  const FarmItem({super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            padding: const EdgeInsets.all(5.0),
            height: 90,
            // width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: contrastColor,
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: mainColor, width: 2),
                          borderRadius: BorderRadius.circular(18.0)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(farmer, height: 70.0))),
                  Text(name, style: const TextStyle(color: Colors.white)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(Icons.arrow_forward_ios, color: mainColor),
                ])),
      ),
    );
  }
}
