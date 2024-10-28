import 'package:cropsense/models/notification.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class NotificationItem extends StatelessWidget {
  final bool isInfo;
  const NotificationItem(
      {super.key, this.isInfo = false, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 90,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: notificationModel.alert == 0 ? mainColor : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, -2)),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10.0),
                    // Text(notificationModel.alert == 0  ? 'Info' : 'Alert',
                    Text(notificationModel.alert == 0 ? 'Info' : 'Alert',
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    const SizedBox(width: 17.0),
                    notificationModel.alert == 0
                        ? const Icon(Icons.info, size: 20)
                        : const Icon(Icons.new_releases_outlined,
                            size: 20, color: Colors.amber),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 10.0),
                  child: Text(
                      // 'You have new weather update for the day yay You have new weather update for the day',
                      notificationModel.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 11, color: Colors.black)),
                )
              ],
            )),
      ),
    );
  }
}
