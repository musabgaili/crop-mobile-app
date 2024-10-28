import 'package:flutter/material.dart';
import '../utils/colors.dart';

class DecoratedTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObsecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final double? size;
  final TextInputType  keyboardType;
  const DecoratedTextField(
      {super.key,
      required this.label,
       this.isObsecure = false,
      required this.hint,
      this.controller,
      this.validator,
      this.borderColor = const Color.fromARGB(255, 66, 66, 74),
      this.size = 0.8,
        this.keyboardType = TextInputType.text
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: MediaQuery.of(context).size.width * size!,
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: isObsecure,
        obscuringCharacter: '*',
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: contrastColor),
          label: Text(label, style: TextStyle(color: contrastColor)),
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor!, width: 2),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor!, width: 2),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
