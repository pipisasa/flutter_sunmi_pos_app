import 'dart:convert';
import 'package:flutter/material.dart';

// Firebase
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// Printer
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:boomerang_pos/printer_utils/printer_output.dart';

import 'package:boomerang_pos/constants.dart';

class POSNotificationData {
  final List<PrinterOutput> printerOuputData;
  final String? notificationTitle;
  final String? notificationBody;

  POSNotificationData({
    required List<Map<String, dynamic>> printerOuputDataJson,
    this.notificationTitle,
    this.notificationBody,
  }) : printerOuputData = printerOuputDataJson
            .map((Map<String, dynamic> data) => PrinterOutput.fromJson(data))
            .toList();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  User? _user;
  bool isUserAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAnalytics.instance.logAppOpen();
    _listenAuthState();
    _initMessaging();
  }

  _listenAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
        isUserAuth = user != null;
      });
    });
  }

  Future<void> _initMessaging() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  void _onPressed() async {
    Map<String, dynamic> messageData = {
      'title': 'Test Title',
      'body': 'Test Body',
      'type': 'pos-terminal',
      'printerOuputData': jsonEncode([
        TextPrinterOutput(text: 'Some Text').toJson(),
        RowPrinterOutput(columns: [
          ColumnMaker(text: 'Left Text', align: SunmiPrintAlign.LEFT),
          ColumnMaker(text: 'Right Text', align: SunmiPrintAlign.RIGHT),
        ]).toJson(),
        QRCodePrinterOutput(text: 'http://google.com').toJson(),
        BarCodePrinterOutput(
          text: '123456789',
        ).toJson(),
        LinePrinterOutput().toJson(),
        LineWrapPrinterOutput(lines: 2).toJson(),
        ImagePrinterOutput(
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/boomerang-c2222.appspot.com/o/FCMImages%2Fphoto_2022-02-07%2009.45.21.jpeg?alt=media&token=daba20ff-d1e3-403a-b87e-06778404cb52',
        ).toJson(),
      ]),
    };

    final POSNotificationData data = POSNotificationData(
      printerOuputDataJson:
          (jsonDecode(messageData['printerOuputData']) as List)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      notificationTitle: messageData['title'],
      notificationBody: messageData['body'],
    );
    try {
      await SunmiPrinter.initPrinter();
      await SunmiPrinter.startTransactionPrint(true);
      await SunmiPrinter.line();
    } catch (e) {
      print(e);
    }

    for (PrinterOutput printerOutput in data.printerOuputData) {
      // await printerOutput.printData();
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: darkBlue.shade900,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
