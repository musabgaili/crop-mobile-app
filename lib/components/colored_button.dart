import '../utils/colors.dart';
import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final Color color;
  final String text;
  final void Function() onPressed;
  const ColoredButton(
      {super.key,
      required this.color,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(backgroundColor: color),
      child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(text,
              style:
                  const TextStyle(color: Colors.white, fontFamily: "Saken"))),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredButton(color: mainColor, text: 'Sign In', onPressed: () {});
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredButton(
        color: contrastColor, text: 'Register', onPressed: () {});
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredButton(color: mainColor, text: 'Save', onPressed: () {});
  }
}
