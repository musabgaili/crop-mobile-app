import '../utils/colors.dart';
import 'package:flutter/material.dart';

class TimeRangeItem extends StatelessWidget {
  final bool isIncome;
  const TimeRangeItem({super.key, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Center(
            child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: contrastColor, borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: contrastColor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: const Text('Daily',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: const Text('Weekly',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: contrastColor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: const Text('Monthly',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              )
            ],
          ),
        )));
  }
}
