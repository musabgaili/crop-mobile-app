import 'package:flutter/material.dart';

class ColoredTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  const ColoredTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = const Color.fromARGB(255, 0, 222, 106)});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.bottomRight,
      child: Center(
        child: TextButton(
            onPressed: onPressed,
            child: Text(text, style: TextStyle(color: color))),
      ),
    );
  }
}
