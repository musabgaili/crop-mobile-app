import 'dart:convert';

import 'package:cropsense/models/notification.dart';
import 'package:cropsense/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationNotifier extends ChangeNotifier {
  NotificationNotifier(this.ref) {
    getNotifications();
  }

  Ref ref;

  bool isLoading = false;

  NotificationService notificaNotificationService = NotificationService();
  List<NotificationModel> notifcations = List.empty(growable: true);
  getNotifications() async {
    // log('message');
    isLoading = true;
    notificaNotificationService.fetchNotifications().then((value) {
      // log(value.body);
      Iterable data = jsonDecode(value.body)['notifications'];
      notifcations =
          data.map((e) => NotificationModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    });
  }
}

final notificationsProvider =
    ChangeNotifierProvider.autoDispose<NotificationNotifier>((ref) {
  return NotificationNotifier(ref);
});
