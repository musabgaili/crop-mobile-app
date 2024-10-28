import '../utils/colors.dart';
import 'package:flutter/material.dart';

class IncomeItem extends StatelessWidget {
  final bool isIncome;
  final String amount;
  const IncomeItem({super.key, required this.isIncome, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Center(
            child: Container(
          height: 115,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
              color: isIncome ? mainColor : contrastColor,
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(amount,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              Text(isIncome ? 'Income' : 'Expenses',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        )));
  }
}
