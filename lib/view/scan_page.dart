import 'package:barcode_app/controller/item_controller.dart';
import 'package:barcode_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanPage extends GetView<ItemController> {
  static const String routeName = "/scan";

  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/m001.jpg"),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Text(
                  controller.qrData.string,
                  style: const TextStyle(fontSize: 24),
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Icon(
                Icons.qr_code_2_rounded,
                size: 180,
                color: greyLight,
              ),
            ),
            Obx(() => Container(
                margin: const EdgeInsets.only(top: 20),
                width: Get.width * 0.8,
                height: Get.height * 0.2,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(controller.qrDataMessage.string)))),
          ],
        )),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 30),
        width: 60,
        height: 60,
        child: FloatingActionButton(
            tooltip: "Scan Barcode",
            onPressed: () {
              controller.scan();
            },
            child: Icon(
              Icons.qr_code,
              color: blueGreyDark,
              size: 36,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
