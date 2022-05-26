import 'dart:convert';
import 'dart:developer';

import 'package:boomerang_pos/printer_utils/printer_output.dart';
import 'package:boomerang_pos/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

class PrintButton extends StatelessWidget {
  const PrintButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Печатать',
        style: Theme.of(context).textTheme.headline6,
      ),
      onPressed: _onPressed,
    );
  }

  void _onPressed() async {
    await SunmiPrinter.bindingPrinter();
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
      ]),
    };

    final POSNotificationData data = POSNotificationData(
      printerOutputDataJson:
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
      log('$e');
    }

    for (PrinterOutput printerOutput in data.printerOutputData) {
      // await printerOutput.printData();
      await printerOutput.printDataWithLogs();
    }
    try {
      await SunmiPrinter.lineWrap(2);
      await SunmiPrinter.line();
      await SunmiPrinter.cut();
      await SunmiPrinter.exitTransactionPrint(true);
    } catch (e) {
      log('$e');
    }
  }
}
