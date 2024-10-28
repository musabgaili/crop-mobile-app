import '../utils/colors.dart';
import 'package:flutter/material.dart';

class TextButtonCustomized extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const TextButtonCustomized(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.bottomRight,
      child: TextButton(
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: mainColor))),
    );
  }
}
