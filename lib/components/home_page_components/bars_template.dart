import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class BarsContainer extends StatelessWidget {
  const BarsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          color: contrastColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('data', style: TextStyle(color: Colors.white)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: mediumGreyColor,
                      child: const Row(children: [
                        Text('Today'),
                        SizedBox(width: 5.0),
                        Icon(Icons.calendar_month)
                      ]),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomizedBar(percentage: 50),
                  CustomizedBar(percentage: 80),
                  CustomizedBar(percentage: 00),
                  CustomizedBar(percentage: 100),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomizedBar extends StatelessWidget {
  final double percentage;
  const CustomizedBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return percentage >= 100 || percentage <= 0
        ? FullBar(isFull: percentage == 100 ? true : false)
        : HalfBar(percentage: percentage);
  }
}

class HalfBar extends StatelessWidget {
  final double percentage;
  const HalfBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(color: mediumGreyColor, height: 130.0, width: 35)),
      Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(color: mainColor, height: 5, width: 40)),
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Container(
                  color: mainColor, height: percentage * 1.300, width: 35))
        ],
      ),
    ]);
  }
}

class FullBar extends StatelessWidget {
  final bool isFull;
  const FullBar({super.key, required this.isFull});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            color: isFull ? mainColor : mediumGreyColor,
            height: 130.0,
            width: 35));
  }
}
