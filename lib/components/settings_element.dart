import 'package:flutter/material.dart';
import '../utils/data.dart';

// This is a customized settings element that uses a customized widget feel free
// to edit its design from here, its used in the settings page (found in the
// bottom navigation bar)

class SettingsElement extends StatelessWidget {
  final String head;
  final List<Widget> settingsArray;
  const SettingsElement(
      {super.key, required this.head, required this.settingsArray});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 20, 5),
            child: Text(head, style: boldMediumBlackTextStyle)),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(children: settingsArray)),
          ),
        ),
      ],
    );
  }
}

// This widget is a customized widget used for the settings page, feel free to
// edit the design from here

class SettingsIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final TextStyle textStyles;
  final double space;
  final Function() onTap;

  const SettingsIconText(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      required this.textStyles,
      required this.space,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 25),
              SizedBox(width: space),
              Text(text, style: textStyles)
            ],
          ),
        ));
  }
}
