import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../global_widgets/round_image.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class FaceIDSetupScreen extends StatelessWidget {
  const FaceIDSetupScreen({super.key});

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
            RoundImage(
                size: 300, borderWidth: 3, image: farmer, color: mainColor),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            const Center(
                child:
                    Text('Face ID is set up', style: TextStyle(fontSize: 26))),
            const SizedBox(height: 20),
            ColoredButton(
                color: Colors.grey,
                text: 'Use Partial Circle',
                onPressed: () {}),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
