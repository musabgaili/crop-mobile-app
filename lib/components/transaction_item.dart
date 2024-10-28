import 'package:flutter/material.dart';
import '../utils/colors.dart';

class TransactionItem extends StatelessWidget {
  final bool isIncome;
  final String transaction;
  final String cost;
  final String date;
  const TransactionItem(
      {super.key,
      required this.isIncome,
      required this.cost,
      required this.date,
      required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Center(
        child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 17.0),
                Icon(Icons.check_circle,
                    size: 25, color: isIncome ? mainColor : contrastColor),
                const SizedBox(width: 17.0),
                SizedBox(
                  width: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction,
                          style: TextStyle(fontSize: 15, color: contrastColor)),
                      const SizedBox(height: 8.0),
                      Text(date,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 15, color: contrastColor))
                    ],
                  ),
                ),
                // const SizedBox(width: 50.0),
                Text(cost,
                    style: TextStyle(
                        fontSize: 15,
                        color: isIncome ? mainColor : contrastColor)),
              ],
            )),
      ),
    );
  }
}
