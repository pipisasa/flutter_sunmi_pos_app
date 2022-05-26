import 'dart:typed_data';
import 'package:http/http.dart' show get;

import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

enum PrinterOutputType { text, row, qrCode, barcode, line, lineWrap, image }

Map<String, PrinterOutputType> _printerOutputTypes = {
  'text': PrinterOutputType.text,
  'row': PrinterOutputType.row,
  'qrCode': PrinterOutputType.qrCode,
  'barcode': PrinterOutputType.barcode,
  'line': PrinterOutputType.line,
  'lineWrap': PrinterOutputType.lineWrap,
  'image': PrinterOutputType.image,
};

abstract class PrinterOutput {
  final PrinterOutputType type;

  factory PrinterOutput.fromJson(json) {
    switch (_printerOutputTypes[json['type']]) {
      case PrinterOutputType.text:
        return TextPrinterOutput.fromJson(json);
      case PrinterOutputType.row:
        return RowPrinterOutput.fromJson(json);
      case PrinterOutputType.qrCode:
        return QRCodePrinterOutput.fromJson(json);
      case PrinterOutputType.barcode:
        return BarCodePrinterOutput.fromJson(json);
      case PrinterOutputType.line:
        return LinePrinterOutput.fromJson(json);
      case PrinterOutputType.lineWrap:
        return LineWrapPrinterOutput.fromJson(json);
      case PrinterOutputType.image:
        return ImagePrinterOutput.fromJson(json);
      default:
        throw Exception('Unknown printer output type: ${json['type']}');
    }
  }

  PrinterOutput({required this.type});

  Future<void> printDataWithLogs() async {
    print('Printing $runtimeType $type');

    print(toJson());

    try {
      await printData();
    } catch (e) {
      print(e);
    }
  }

  Future<void> printData();
  Map<String, dynamic> toJson();
}

class TextPrinterOutput extends PrinterOutput {
  final String text;
  final bool isBold;
  final SunmiFontSize fontSize;
  final SunmiPrintAlign align;

  TextPrinterOutput({
    required this.text,
    bool? isBold = false,
    SunmiFontSize? fontSize = SunmiFontSize.MD,
    SunmiPrintAlign? align = SunmiPrintAlign.LEFT,
  })  : isBold = isBold ?? false,
        fontSize = fontSize ?? SunmiFontSize.MD,
        align = align ?? SunmiPrintAlign.LEFT,
        super(type: PrinterOutputType.text);

  factory TextPrinterOutput.fromJson(Map<String, dynamic> json) {
    return TextPrinterOutput(
        text: json['text'],
        fontSize: fontSizes[json['fontSize']],
        align: aligns[json['align']],
        isBold: json['isBold']);
  }

  static const Map<String, SunmiFontSize> fontSizes = {
    'XS': SunmiFontSize.XS,
    'SM': SunmiFontSize.SM,
    'MD': SunmiFontSize.MD,
    'LG': SunmiFontSize.LG,
    'XL': SunmiFontSize.XL,
  };

  static const Map<String, SunmiPrintAlign> aligns = {
    'LEFT': SunmiPrintAlign.LEFT,
    'CENTER': SunmiPrintAlign.CENTER,
    'RIGHT': SunmiPrintAlign.RIGHT,
  };

  @override
  printData() async {
    return SunmiPrinter.printText(
      text,
      style: SunmiStyle(
        fontSize: fontSize,
        align: align,
        bold: isBold,
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'text',
      'text': text,
      'fontSize':
          fontSizes.keys.firstWhere((key) => fontSizes[key] == fontSize),
      'align': aligns.keys.firstWhere((key) => aligns[key] == align),
      'isBold': isBold,
    };
  }
}

class RowPrinterOutput extends PrinterOutput {
  final List<ColumnMaker> columns;

  RowPrinterOutput({required this.columns})
      : super(type: PrinterOutputType.row);

  factory RowPrinterOutput.fromJson(Map<String, dynamic> json) {
    return RowPrinterOutput(
        columns: (json['columns'] as List<dynamic>)
            .map<ColumnMaker>((col) => ColumnMaker(
                  text: col['text'],
                  width: col['width'] ?? 2,
                  align: aligns[col['align']] ?? SunmiPrintAlign.LEFT,
                ))
            .toList());
  }

  static const Map<String, SunmiPrintAlign> aligns = {
    'LEFT': SunmiPrintAlign.LEFT,
    'CENTER': SunmiPrintAlign.CENTER,
    'RIGHT': SunmiPrintAlign.RIGHT,
  };

  @override
  printData() async {
    return SunmiPrinter.printRow(
      cols: columns,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'row',
      'columns': columns
          .map((col) => ({
                'text': col.text,
                'width': col.width,
                'align':
                    aligns.keys.firstWhere((key) => aligns[key] == col.align),
              }))
          .toList(),
    };
  }
}

class QRCodePrinterOutput extends PrinterOutput {
  final String text;
  final int size;
  final SunmiQrcodeLevel errorLevel;

  QRCodePrinterOutput({
    required this.text,
    int? size = 5,
    SunmiQrcodeLevel? errorLevel = SunmiQrcodeLevel.LEVEL_H,
  })  : size = size ?? 5,
        errorLevel = errorLevel ?? SunmiQrcodeLevel.LEVEL_H,
        super(type: PrinterOutputType.qrCode);

  factory QRCodePrinterOutput.fromJson(Map<String, dynamic> json) {
    return QRCodePrinterOutput(
      text: json['text'],
      size: json['size'],
      errorLevel: qrErrorLevels[json['errorLevel']],
    );
  }

  static const Map<String, SunmiQrcodeLevel> qrErrorLevels = {
    'LEVEL_L': SunmiQrcodeLevel.LEVEL_L,
    'LEVEL_M': SunmiQrcodeLevel.LEVEL_M,
    'LEVEL_Q': SunmiQrcodeLevel.LEVEL_Q,
    'LEVEL_H': SunmiQrcodeLevel.LEVEL_H,
  };

  @override
  printData() async {
    return SunmiPrinter.printQRCode(text, size: size, errorLevel: errorLevel);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'qrCode',
      'text': text,
      'size': size,
      'errorLevel': qrErrorLevels.keys
          .firstWhere((key) => qrErrorLevels[key] == errorLevel),
    };
  }
}

class BarCodePrinterOutput extends PrinterOutput {
  final String text;
  final SunmiBarcodeType barcodeType;
  final int height;
  final int width;
  final SunmiBarcodeTextPos textPosition;

  BarCodePrinterOutput(
      {required this.text,
      SunmiBarcodeType? barcodeType = SunmiBarcodeType.CODE128,
      int? height = 162,
      int? width = 2,
      SunmiBarcodeTextPos? textPosition = SunmiBarcodeTextPos.TEXT_ABOVE})
      : barcodeType = barcodeType ?? SunmiBarcodeType.CODE128,
        height = height ?? 162,
        width = width ?? 2,
        textPosition = textPosition ?? SunmiBarcodeTextPos.TEXT_ABOVE,
        super(type: PrinterOutputType.barcode);

  factory BarCodePrinterOutput.fromJson(Map<String, dynamic> json) {
    return BarCodePrinterOutput(
      text: json['text'],
      barcodeType: barcodeTypes[json['barcodeType']],
      height: json['height'],
      width: json['width'],
      textPosition: textPositions[json['textPosition']],
    );
  }

  static const Map<String, SunmiBarcodeType> barcodeTypes = {
    'UPCA': SunmiBarcodeType.UPCA,
    'UPCE': SunmiBarcodeType.UPCE,
    'JAN13': SunmiBarcodeType.JAN13,
    'JAN8': SunmiBarcodeType.JAN8,
    'CODE39': SunmiBarcodeType.CODE39,
    'ITF': SunmiBarcodeType.ITF,
    'CODABAR': SunmiBarcodeType.CODABAR,
    'CODE93': SunmiBarcodeType.CODE93,
    'CODE128': SunmiBarcodeType.CODE128,
  };

  static const Map<String, SunmiBarcodeTextPos> textPositions = {
    'NO_TEXT': SunmiBarcodeTextPos.NO_TEXT,
    'TEXT_ABOVE': SunmiBarcodeTextPos.TEXT_ABOVE,
    'TEXT_UNDER': SunmiBarcodeTextPos.TEXT_UNDER,
    'BOTH': SunmiBarcodeTextPos.BOTH,
  };

  @override
  printData() async {
    return SunmiPrinter.printBarCode(text,
        barcodeType: barcodeType,
        height: height,
        width: width,
        textPosition: textPosition);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'barcode',
      'text': text,
      'barcodeType': barcodeTypes.keys
          .firstWhere((key) => barcodeTypes[key] == barcodeType),
      'height': height,
      'width': width,
      'textPosition': textPositions.keys
          .firstWhere((key) => textPositions[key] == textPosition),
    };
  }
}

class LinePrinterOutput extends PrinterOutput {
  final int length;
  final String character;

  LinePrinterOutput({int? length = 31, String? character = '-'})
      : length = length ?? 31,
        character = character ?? '-',
        super(type: PrinterOutputType.line);

  factory LinePrinterOutput.fromJson(Map<String, dynamic> json) {
    return LinePrinterOutput(
      length: json['length'],
      character: json['character'],
    );
  }

  @override
  printData() async {
    return SunmiPrinter.line(ch: character, len: length);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'line',
      'length': length,
      'character': character,
    };
  }
}

class LineWrapPrinterOutput extends PrinterOutput {
  final int lines;

  LineWrapPrinterOutput({required this.lines})
      : super(type: PrinterOutputType.lineWrap);

  factory LineWrapPrinterOutput.fromJson(Map<String, dynamic> json) {
    return LineWrapPrinterOutput(
      lines: json['lines'],
    );
  }

  @override
  printData() async {
    return SunmiPrinter.lineWrap(lines);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'lineWrap',
      'lines': lines,
    };
  }
}

class ImagePrinterOutput extends PrinterOutput {
  final String imageUrl;
  // final ;

  ImagePrinterOutput({required this.imageUrl})
      : super(type: PrinterOutputType.image);

  factory ImagePrinterOutput.fromJson(Map<String, dynamic> json) {
    return ImagePrinterOutput(
      imageUrl: json['imageUrl'],
    );
  }

  Future<Uint8List?> _downloadImage() async {
    try {
      final response = await get(Uri.parse(imageUrl));
      return response.bodyBytes;
    } catch (e) {
      return null;
    }
  }

  @override
  printData() async {
    final image = await _downloadImage();
    return image != null ? SunmiPrinter.printImage(image) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'image',
      'imageUrl': imageUrl,
    };
  }
}
