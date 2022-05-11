import 'dart:convert';
import 'dart:developer';
import 'package:boomerang_pos/screens/home/home_screen.dart';
import 'package:boomerang_pos/services/auth/firebase_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

// Firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Printer
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:boomerang_pos/printer_utils/printer_output.dart';

import 'package:boomerang_pos/constants.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  printCheck(message);
}

void printCheck(RemoteMessage message) async {
  await SunmiPrinter.bindingPrinter();

  if (message.data['type'] == 'pos-terminal'||message.from == 'pos-terminal') {
    // List<PrinterOutput> printerOutputDataJson = (jsonDecode(message.data['printerOutputData']) as List)
    //         .map<PrinterOutput>((data) => PrinterOutput.fromJson(data as Map<String, dynamic>))
    //         .toList();

    final outputId = message.data['outputId'];
    
    final jsonData = (await FirebaseFirestore.instance.collection('printer_output').doc(outputId).get()).data();

    log('JSON DATA $jsonData');
    if(jsonData == null || jsonData['data'] == null) return;

    List<PrinterOutput> printerOutputDataJson = (jsonData['data'] as List)
        .map<PrinterOutput>((data) => PrinterOutput.fromJson(data as Map<String, dynamic>))
        .toList();
    
    try {
      await SunmiPrinter.initPrinter();
      await SunmiPrinter.startTransactionPrint(true);
      await SunmiPrinter.line();
    } catch (e) {
      log('$e');
    }

    for (PrinterOutput printerOutputJson in printerOutputDataJson) {
      await printerOutputJson.printDataWithLogs();
    }
    try {
      await SunmiPrinter.lineWrap(2);
      await SunmiPrinter.line();
      await SunmiPrinter.cut();
      await SunmiPrinter.exitTransactionPrint(true);
    } catch (e) {
      print(e);
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await SunmiPrinter.bindingPrinter();
  await FirebaseMessaging.instance.subscribeToTopic('pos-terminal');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
    printCheck(event);
  });

  //? Initialize GetIt
  GetIt.I.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  //? Set app orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FirebaseAuth.instance.authStateChanges().listen((user) async {
    if (user != null) {
      final token = await FirebaseMessaging.instance.getToken();
      print("Token is: $token");
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
