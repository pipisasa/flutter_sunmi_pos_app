import 'dart:convert';
import 'package:boomerang_pos/screens/home/home_screen.dart';
import 'package:boomerang_pos/services/auth/firebase_auth_service.dart';
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
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  // print("Handling a background message: ${message.messageId}");
  await SunmiPrinter.bindingPrinter();
  // final bool? isPrinterBind = await SunmiPrinter.bindingPrinter();
  // final int paperSize = await SunmiPrinter.paperSize();
  // final String printerVersion = await SunmiPrinter.printerVersion();
  // final String printerSerialNumber = await SunmiPrinter.serialNumber();

  if (message.data['type'] == 'pos-terminal' ||
      message.from == 'pos-terminal') {
    // List<PrinterOutput> printerOuputData = (jsonDecode(message.data['printerOuputData']) as List)
    //         .map<PrinterOutput>((data) => PrinterOutput.fromJson(data as Map<String, dynamic>))
    //         .toList();
    List printerOuputDataJson = jsonDecode(message.data['printerOuputData']);
    try {
      await SunmiPrinter.initPrinter();
      await SunmiPrinter.startTransactionPrint(true);
      await SunmiPrinter.line();
    } catch (e) {
      print(e);
    }

    for (PrinterOutput printerOutputJson in printerOuputDataJson) {
      // await printerOutput.printData();
      PrinterOutput printerOutput =
          PrinterOutput.fromJson(printerOutputJson as Map<String, dynamic>);
      await printerOutput.printDataWithLogs();
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

  //? Initialize GetIt
  GetIt.I.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  //? Set app orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
