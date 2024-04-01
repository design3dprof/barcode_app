import 'package:barcode_app/utils/styles.dart';
import 'package:barcode_app/view/create_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});

  //final ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: Get.width * 0.5,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DrawerHeader(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.only(bottom: 20),
                      child: const Icon(Icons.person_2_rounded, size: 80,),),
                      Text("", style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: green),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const MenuItem(
                icon: Icons.home,
                text: "Home",
                //widget: HomePage(),
                titleMain: "",
                titleSub: "",
                index: 0,
              ),
              MenuItem(
                icon: Icons.qr_code_rounded,
                text: "Create",
                widget: CreatePage(),
                index: 3,
                titleMain: 'Login ',
                titleSub: 'Page',
              ),
              const MenuItem(
                icon: Icons.calendar_today_rounded,
                text: "Calendar",
                //widget: CalendarPage(),
                index: 1,
                titleMain: 'Calendar ',
                titleSub: 'Page',
              ),
              const MenuItem(
                icon: Icons.list_alt_rounded,
                text: "List",
                //widget: ListPage(),
                index: 2,
                titleMain: 'Report ',
                titleSub: 'List',
              ),
              const MenuItem(
                icon: Icons.settings,
                text: "Settings",
                //widget: SettingsPage(),
                index: 4,
                titleMain: 'Settings ',
                titleSub: 'Page',
              ),
              Divider(
                height: 20,
                thickness: 3,
                indent: 10,
                endIndent: 10,
                color: greyLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? widget;
  final String titleMain;
  final String titleSub;
  final int index;

  const MenuItem(
      {super.key,
        required this.icon,
        required this.text,
        this.widget,
        required this.index,
        required this.titleMain,
        required this.titleSub});

  menuSelect() {
    switch (text) {
      case "Home":
        {
          Get.offAndToNamed("/home");
        }
        break;
      case "List":
        if (widget != null) {
          Get.offAndToNamed("/home", arguments: [widget, titleMain, titleSub]);
        }
        break;
      default:
        {
          if (widget != null) {
            Get.offAndToNamed("/home",
                arguments: [widget, titleMain, titleSub]);
          }
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        menuSelect();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}