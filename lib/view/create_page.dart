import 'package:barcode_app/controller/item_controller.dart';
import 'package:barcode_app/screen/custom_widgets.dart';
import 'package:barcode_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePage extends GetView<ItemController> {
  static const String routeName = "/create";

  CreatePage({super.key});

  final TextEditingController noteController = TextEditingController();

  _tappedItem(index) async {
    switch (index) {
      case 0:
        //
        break;
      case 1:
        //
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Create barcode",
                textAlign: TextAlign.center,
                style: textHead(darkBlue),
              ),
            ),
            const MyDropDown(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: Get.width * 0.8,
              child: TextField(
                controller: noteController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Note',
                    labelStyle: TextStyle(
                      color: darkBlue,
                    )),
                maxLines: 4,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text,
                //onSubmitted: (value) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                  onPressed: () {
                    controller.setData(noteController.text);
                    const MyBarcode().buildQrCode();
                  },
                  child: Text(
                    "Create",
                    style: textHead(darkBlue),
                  )),
            ),
            Divider(
              height: 50,
              thickness: 3,
              indent: 100,
              endIndent: 100,
              color: greyLight,
            ),
            Obx(() => InkWell(
                  onTap: () {
                    //print("hello");
                  },
                  child: Container(
                    //margin: const EdgeInsets.only(top: 50),
                    width: 200,
                    height: 200,
                    child: controller.isImage.isTrue
                        ? Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: MemoryImage(
                                        controller.pngBytes.value),
                                    fit: BoxFit.fill)),
                          )
                        : Container(),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: Obx(() => Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 8, color: controller.selectedColor.value),
                borderRadius: BorderRadius.circular(20)),
            child: FloatingActionButton(
                backgroundColor: Colors.grey.shade100,
                child: ColorPickerButton(
                  selectedColor: controller.selectedColor.value,
                ),
                onPressed: () {}),
          )),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade200.withOpacity(0.6),
          selectedItemColor: darkBlue,
          onTap: _tappedItem,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.send_rounded,
                color: blueGrey,
              ),
              label: 'PDF',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_email_rounded,
                color: blueGrey,
              ),
              label: 'Send',
            ),
          ]),
    );
  }
}
