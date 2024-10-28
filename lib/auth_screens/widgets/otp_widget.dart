import 'package:flutter/material.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  void _submitOtp(BuildContext context) {
    final otp =
  '${_controller1.text}${_controller2.text}${_controller3.text}${_controller4.text}';
    // for debugging
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('OTP Submitted: $otp')));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOtpTextField(_controller1, _focusNode1, _focusNode2),
        const SizedBox(width: 30),
        _buildOtpTextField(_controller2, _focusNode2, _focusNode3),
        const SizedBox(width: 30),
        _buildOtpTextField(_controller3, _focusNode3, _focusNode4),
        const SizedBox(width: 30),
        _buildOtpTextField(_controller4, _focusNode4, null),
      ],
    );
  }

  Widget _buildOtpTextField(TextEditingController controller,
      FocusNode focusNode, FocusNode? nextFocusNode) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (nextFocusNode != null) {
              FocusScope.of(focusNode.context!).requestFocus(nextFocusNode);
            } else {
              focusNode.unfocus();
              _submitOtp(focusNode.context!);
            }
          }
        },
      ),
    );
  }
}
