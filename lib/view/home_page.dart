import 'package:barcode_app/controller/item_controller.dart';
import 'package:barcode_app/utils/main_menu.dart';
import 'package:barcode_app/utils/styles.dart';
import 'package:barcode_app/view/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ItemController controller = Get.find();

  late Widget page;

  @override
  void initState() {
    super.initState();
    getData();
    page = const ScanPage();
  }

  void getData() async {
    //await controller.readWork();
  }

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MainMenu(),
        appBar: AppBar(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Barcode Scanner\n",
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "Scan barcode!",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: green),
                  ),
                ]),
          ),
          centerTitle: true,
          //backgroundColor: blueGrey,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xffB1097C),
                  Color(0xff0947B1),
                ]),
          )),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/m003.jpg"),
                  fit: BoxFit.cover,
                )),
          child: Center(
            child: (Get.arguments != null)
                ? Container(child: Get.arguments[0])
                : Container(child: page),
          ),
        ),
      ),
    );
  }
}
