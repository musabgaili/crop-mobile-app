import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';
import 'login_screen.dart';
import 'widgets/logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Logo(
            isColored: true,
          ),
          const SizedBox(height: 120),
          ColoredButton(
              color: mainColor,
              text: 'Log in',
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }),
          const SizedBox(height: 15),
          ColoredButton(
              color: contrastColor, text: 'Sign up', onPressed: () {}),
        ],
      ),
    );
  }
}
