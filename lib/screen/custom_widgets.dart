import 'package:barcode_app/controller/item_controller.dart';
import 'package:barcode_app/utils/global_parameters.dart';
import 'package:barcode_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

// TextField to login page
class MyEditText extends StatelessWidget {
  final String hintText;
  final String labelHint;
  final TextEditingController editingController;
  final bool enable;
  final TextInputType inputType;
  final bool password;

  const MyEditText(
      {super.key,
      required this.hintText,
      required this.labelHint,
      required this.editingController,
      required this.enable,
      required this.inputType,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.6,
      margin: marginLogin,
      child: Padding(
        padding: marginHorizontal,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          obscureText: password,
          enableSuggestions: !password,
          autocorrect: !password,
          enabled: enable,
          controller: editingController,
          keyboardType: inputType,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter
          ],
          style: textSubTitle(blueGreyDark),
          decoration: InputDecoration(
              labelText: labelHint,
              labelStyle: textSubTitle(blueGreyDark),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7.0))),
        ),
      ),
    );
  }
}

class MyDropDown extends GetView<ItemController> {
  const MyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
        builder: (controller) => Container(
              width: Get.width * 0.4,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Item',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //hint: const Text('Select Item'), // Optional text to display as hint
                value: controller.myDropdownValue.value,
                onChanged: (newValue) {
                  controller.setDropDown(newValue);
                  controller.changeBarcode(
                      GlobalParameter.barcodeNameList().indexOf(newValue!));
                },
                items: List.generate(
                    GlobalParameter.barcodeNameList().length,
                    (index) => DropdownMenuItem(
                        value: GlobalParameter.barcodeNameList()[index],
                        child: Text(GlobalParameter.barcodeNameList()[index],
                            textAlign: TextAlign.center))),
              ),
            ));
  }
}

class MyBarcode extends GetView<ItemController> {
  const MyBarcode({super.key});

  // Create User data qrcode
  buildQrCode() async {
    double width = 150;
    double height = 150;
    // Create a PDF document.
    final doc = pw.Document();
    // Add page to the PDF
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(width, height),
        build: (context) => pw.BarcodeWidget(
          data: controller.qrData.string,
          color: PdfColor.fromInt(controller.selectedColor.value.value),
          //PdfColors.indigo900,  //controller.selectedColor.value
          width: width,
          height: height,
          barcode: controller.barcode.value,
          //barcode: pw.Barcode.qrCode(),
          drawText: true,
        ),
      ),
    );

    // Create Image from pdf qrcode
    try {
      await for (var page
          in Printing.raster(await doc.save(), pages: [0], dpi: 72)) {
        //final image = page.toImage(); // ...or page.toPng()
        final image = page.toPng();
        controller.pngBytes.value = await image;
        //print(controller.pngBytes.value.toString());
      }
      await doc.save();
      controller.isImage.value = true;
      controller.update();
    } catch (e) {
      Get.snackbar(
        "Error: ",
        "$e error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ColorPickerButton extends GetView<ItemController> {
  final Color selectedColor; // Default color

  const ColorPickerButton({super.key, required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            _showColorPickerDialog(context);
          },
          icon: const Icon(
            Icons.color_lens,
            size: 40,
          ),
        ),
        //const SizedBox(height: 20),
      ],
    );
  }

  Future<void> _showColorPickerDialog(BuildContext context) async {
    Color pickedColor = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a Color'),
          content: SingleChildScrollView(
            child: ColorPicker(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedColor);
              },
              child: const Text('Select'),
            ),
          ],
        );
      },
    );
    //onColorChanged(pickedColor);
    //print(" Color --- $pickedColor");
  }
}

class ColorPicker extends GetView<ItemController> {
  ColorPicker({super.key});

  final Map<String, List<Color>> colorPalette = {
    'Reds': [
      Colors.red,
      Colors.pink,
      Colors.deepPurple[300]!,
      Colors.redAccent,
      Colors.pinkAccent,
    ],
    'Blues': [
      Colors.lightBlue.shade100,
      Colors.lightBlueAccent,
      Colors.blue,
      Colors.blueAccent.shade700,
      Colors.indigo.shade800,
    ],
    'Greens': [
      Colors.lightGreenAccent,
      Colors.green,
      Colors.lightGreen,
      Colors.teal[300]!,
      Colors.greenAccent,
    ],
    'Yellows & Oranges': [
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.yellowAccent,
      Colors.amberAccent,
      Colors.orangeAccent,
    ],
    'Purples': [
      Colors.purple,
      Colors.deepPurple,
      Colors.purpleAccent,
      Colors.deepPurpleAccent,
    ],
    'Cyans & Teals': [
      Colors.cyan,
      Colors.teal,
      Colors.cyanAccent,
      Colors.tealAccent,
    ],
    'Browns': [
      Colors.brown,
      Colors.brown[300]!,
    ],
    'Greys': [
      Colors.grey,
      Colors.blueGrey,
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      height: Get.height * 0.7,
      child: ListView.builder(
        itemCount: colorPalette.length,
        itemBuilder: (context, index) {
          String title = colorPalette.keys.toList()[index];
          List<Color> colors = colorPalette.values.toList()[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.0,
                ),
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return ColorSwatch(
                      color: colors[index], onSelect: _selectColor);
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }

  void _selectColor(Color color) {
    controller.setSelectedColor(color);
  }
}

class ColorSwatch extends StatelessWidget {
  final Color color;
  final Function(Color) onSelect;

  ColorSwatch({super.key, required this.color, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(color);
      },
      child: Container(
        height: 50,
        width: 50,
        color: color,
        margin: const EdgeInsets.all(5),
      ),
    );
  }
}
