import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class TaskWidget extends StatelessWidget {
  final String number;
  const TaskWidget({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 17.0),
            const Icon(Icons.library_books_outlined,
                size: 30, color: Colors.white),
            const SizedBox(width: 17.0),
            const Text('Tasks Day',
                style: TextStyle(fontSize: 15, color: Colors.white)),
            SizedBox(width: MediaQuery.of(context).size.width * 0.55),
            Text(number,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
