import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class MessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? _token;

  String? get token => _token;

  Future init() async {
    final settings = await _requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _getToken();
      _registerForegroundMessageHandler();
    }
  }

  Future _getToken() async {
    _token = await _firebaseMessaging.getToken();

    log("FCM: $_token");

    _firebaseMessaging.onTokenRefresh.listen((token) {
      _token = token;
    });
  }

  Future<NotificationSettings> _requestPermission() async {
    return await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        announcement: false);
  }

  void _registerForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      log(" --- foreground message received ---");
      log('${remoteMessage.notification!.title}');
      log('${remoteMessage.notification!.body}');
      showSimpleNotification(
          Text('${remoteMessage.notification!.title}'),
          subtitle: Text('${remoteMessage.notification!.body}'),
          background: Colors.white,
        duration: const Duration(seconds: 2),
      );
    });
  }
}
