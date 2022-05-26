import 'dart:developer';
import 'package:boomerang_pos/screens/home/home_screen.dart';
import 'package:boomerang_pos/services/auth/firebase_auth_service.dart';
import 'package:boomerang_pos/services/messaging/messaging_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';

// Firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Printer
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

import 'package:boomerang_pos/constants.dart';

void printCheck(RemoteMessage message) async {
  await SunmiPrinter.bindingPrinter();

  if (message.data['type'] == 'pos-terminal' ||
      message.from == 'pos-terminal') {
    final outputId = message.data['outputId'];

    final jsonData = (await FirebaseFirestore.instance
            .collection('printer_output')
            .doc(outputId)
            .get())
        .data();

    if (jsonData == null || jsonData['data'] == null) return;
  }
}

MessagingService _msgService = MessagingService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize GetIt
  GetIt.I.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  Get.put<FirebaseFirestore>(FirebaseFirestore.instance);

  //? Set app orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FirebaseAuth.instance.authStateChanges().listen((user) async {
    if (user != null) {
      final token = await FirebaseMessaging.instance.getToken();
      log("Token is: $token");
    }
  });
  await _msgService.init();

  runApp(const MyApp());
}

/// Top level function to handle incoming messages when the app is in the background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log(" --- background message received ---");
  log('${message.notification!.title}');
  log('${message.notification!.body}');
  showSimpleNotification(
    Text('${message.notification!.title}'),
    subtitle: Text('${message.notification!.body}'),
    background: Colors.white,
    duration: const Duration(seconds: 2),
  );
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
