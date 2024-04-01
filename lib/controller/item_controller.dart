import 'dart:io';

import 'package:barcode_app/screen/custom_widgets.dart';
import 'package:barcode_app/utils/global_parameters.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ItemController extends GetxController {
  RxString qrData = "".obs;
  RxString qrDataMessage = "".obs;
  var messageLog = StringBuffer();

  RxBool isImage = false.obs;
  RxBool isProgress = false.obs;

  final myDropdownValue = "".obs;
  Rx<Uint8List> pngBytes = Uint8List.fromList([]).obs;

  var selectedColor = Colors.indigo.shade900.obs;

  // user data qrcode image
  Rx<pw.Barcode> barcode = pw.Barcode.qrCode().obs;

  ItemController() {
    setDropDown(GlobalParameter.barcodeNameList().first);
  }

  scan() async {
    try {
      final barcode = await BarcodeScanner.scan();
      qrData.value = barcode.type.toString();
      setMessage(barcode.type.toString());
      setMessage(barcode.rawContent.toString());
    } catch (error) {
      Get.snackbar(
        "Error scan barcode!",
        "$error error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  getProfileImage() async {
    try {
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      final file = File('${appDocumentsDir.path}/self.jpg');
      //myImage.value = file.path;
      isImage.value = true;
      update();
    } catch (e) {
      Get.snackbar(
        "Error reading file!",
        "$e error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }

  setSelectedColor(color) {
    selectedColor.value = color;
    if (qrData.string.isNotEmpty) {
      MyBarcode().buildQrCode();
    }
    update();
  }

  changeBarcode(index) {
    barcode.value = GlobalParameter.barcodeList().elementAt(index);
    update();
  }

  changeProgress() {
    isProgress.toggle();
  }

  setDropDownList() {
    setDropDown("");
  }

  setDropDown(string) {
    myDropdownValue.value = string;
    update();
  }

  // Store scanned barcode data
  setData(string) {
    qrData.value = string;
    update();
  }

  // Create barcode scan message log
  setMessage(string) {
    messageLog.writeln(string);
    qrDataMessage.value = messageLog.toString();
    update();
  }
}
