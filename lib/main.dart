import 'dart:developer';
import 'package:boomerang_pos/screens/home/home_screen.dart';
import 'package:boomerang_pos/services/auth/firebase_auth_service.dart';
import 'package:boomerang_pos/services/messaging/messaging_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

// Firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:boomerang_pos/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Get.put<FirebaseAuthService>(FirebaseAuthService());
  Get.put<FirebaseFirestore>(FirebaseFirestore.instance);
  Get.put<FirebaseMessaging>(FirebaseMessaging.instance);
  Get.putAsync<MessagingService>(() => MessagingService().init());

  //? Set app orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

/// Top level function to handle incoming messages when the app is in the background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log(" --- BACKGROUND MESSAGE RECEIVED ---");
  log('${message.notification!.title}');
  log('${message.notification!.body}');
  // showSimpleNotification(
  //   Text('${message.notification!.title}'),
  //   subtitle: Text('${message.notification!.body}'),
  //   background: Colors.white,
  //   duration: const Duration(seconds: 2),
  // );
  try {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log('Firebase app already exist: $e');
  }
  await Future.delayed(Duration(seconds: 2));
  onRemoteMessage(message);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Boomerang POS Terminal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          fontFamily: "Roboto",
          primarySwatch: limeGreen,
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
