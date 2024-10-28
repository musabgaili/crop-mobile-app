import '../utils/colors.dart';
import 'package:flutter/material.dart';

/// The `TextFieldCustomized` class is a customized widget in Dart that creates a styled text field with
/// optional obscuring of text input.
class TextFieldCustomized extends StatelessWidget {
  final bool isObsecure;
  const TextFieldCustomized({super.key, required this.isObsecure});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: contrastColor, width: 1)),
      child: TextField(obscureText: isObsecure, obscuringCharacter: '*'),
    );
  }
}

class TextFieldFormCustomized extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObsecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFieldFormCustomized(
      {super.key,
      required this.label,
      required this.isObsecure,
      required this.hint,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: isObsecure,
        obscuringCharacter: '*',
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: contrastColor),
          label: Text(label, style: TextStyle(color: contrastColor)),
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: contrastColor, width: 2),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: contrastColor, width: 2),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
