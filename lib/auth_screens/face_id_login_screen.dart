import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/custom_icon.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class FaceIDLoginScreen extends StatelessWidget {
  const FaceIDLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            CustomIcon(iconName: faceID, height: 200),
            const SizedBox(height: 10),
            const Center(
                child: Text('Log in with Face ID',
                    style: TextStyle(fontSize: 26))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            ColoredButton(
                color: contrastColor, text: 'Get Started', onPressed: () {}),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
