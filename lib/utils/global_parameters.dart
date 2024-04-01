import 'package:pdf/widgets.dart' as pw;

class GlobalParameter {

  static Map<String, pw.Barcode> barcodeMap = {
    "QrCode": pw.Barcode.qrCode(),
    "Pdf417": pw.Barcode.pdf417(),
    "Aztec": pw.Barcode.aztec(),
    "DataMatrix": pw.Barcode.dataMatrix(), //Color(0xFFFBC02D), //Colors.yellow.shade700
    "Code128": pw.Barcode.code128(),
    "Code93": pw.Barcode.code93(),
    "Code39": pw.Barcode.code39(),
    "Isbn": pw.Barcode.isbn(),
    "EAN13": pw.Barcode.ean13(),
    "EAN8": pw.Barcode.ean8(),
    "EAN5": pw.Barcode.ean5(),
    "EAN2": pw.Barcode.ean2(),
    "Telepen": pw.Barcode.telepen(),
    "UpcA": pw.Barcode.upcA(),
    "UpcE": pw.Barcode.upcE(),
    "RM4scc": pw.Barcode.rm4scc(),
  };

  static List<String> barcodeNameList() {
    return barcodeMap.keys.toList();
  }

  static List<pw.Barcode> barcodeList() {
    return barcodeMap.values.toList();
  }


}