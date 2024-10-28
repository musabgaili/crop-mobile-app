import 'package:flutter/material.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';

class FaceIDDoneScreen extends StatelessWidget {
  const FaceIDDoneScreen({super.key});

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
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            // CustomIcon(iconName: faceID, height: 200),
            Icon(Icons.check_circle_outlined, color: mainColor, size: 200),
            const SizedBox(height: 10),
            const Center(
                child: SizedBox(
              width: 250,
              child: Text('Face ID is now set up',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26)),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            ColoredButton(color: mainColor, text: 'Done', onPressed: () {}),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
