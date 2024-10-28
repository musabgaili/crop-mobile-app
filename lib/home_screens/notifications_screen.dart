
import 'package:cropsense/providers/notifications_provider.dart';
import 'package:cropsense/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/notification_widget.dart';

String title = 'Notifications';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifcationsProvider = ref.watch(notificationsProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Notifications'),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.black),
            )),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: MediaQuery.of(context).size.width * 0.1,
            //   ),
            //   child: Text(title,
            //       style: const TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //           fontWeight: FontWeight.w700)),
            // ),
            // const SizedBox(height: 10),
            if (notifcationsProvider.isLoading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                ),
              )
            else
              ...notifcationsProvider.notifcations
                  .map((e) => NotificationItem(isInfo: true,notificationModel: e,))
                  // ignore: unnecessary_to_list_in_spreads
                  .toList(),
            // const NotificationItem(isInfo: false),
          ],
        )));
  }
}
