import 'package:flutter/material.dart';
import '../utils/colors.dart';

class NotificationItem extends StatelessWidget {
  final bool isNew;
  const NotificationItem({super.key, required this.isNew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Center(
        child: Container(
            height: 115,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: isNew ? contrastColor : greyColor,
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 17.0),
                    Icon(Icons.check_circle, size: 25, color: mainColor),
                    const SizedBox(width: 17.0),
                    Text('New Update',
                        style: TextStyle(
                            fontSize: 15,
                            color: isNew ? Colors.white : contrastColor)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                'You have new weather update for the day You have new weather update for the day',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                )
              ],
            )),
      ),
    );
  }
}
