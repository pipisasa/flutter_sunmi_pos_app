import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsManager {
  final localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final _callbacks = <String, VoidCallback>{};

  LocalNotificationsManager() {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/badge_icon'),
      iOS: IOSInitializationSettings(),
    );
    localNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  void showPushNotification(String? title, String? body, int notifId) {
    _showNotification(
      title: title,
      body: body,
      notificationId: notifId,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'misc',
          'Push Notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: IOSNotificationDetails(
          presentAlert: true,
          presentSound: true,
        ),
      ),
    );
  }

  void _showNotification(
      {String? title,
      String? body,
      int? notificationId,
      NotificationDetails? notificationDetails}) {
    localNotificationsPlugin.show(
      notificationId!,
      title,
      body,
      notificationDetails,
    );
  }

  Future<dynamic> onSelectNotification(String? payload) async {
    _callbacks.remove(payload)?.call();
  }
}
