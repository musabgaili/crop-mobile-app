import 'package:flutter/material.dart';

import '../../global_widgets/decorated_text_field.dart';
import '../../utils/colors.dart';

class FieldsWidget extends StatelessWidget {
  final TextEditingController controller;
  final double? size;
  final String name;
  final TextInputType  keyboardType;

  const FieldsWidget(
      {super.key,
      required this.controller,
      this.size = 0.8,
      required this.name,
      this.keyboardType = TextInputType.text,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        DecoratedTextField(
          keyboardType: keyboardType,
            label: '',
            size: size!,
            hint: '',
            isObsecure: false,
            borderColor: mainColor,
            controller: controller,
            validator: (value) =>
                value!.isEmpty ? 'Please Enter a value' : null),
      ],
    );
  }
}
