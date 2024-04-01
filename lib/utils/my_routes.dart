import 'package:barcode_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRoutes {
  static const String home = HomePage.routeName;
  //static const String scan = ScanPage.routeName;
  //static const String report = ReportPage.routeName;
  //static const String calendar = CalendarPage.routeName;
  //static const String login = LoginPage.routeName;
  //static const String list = ListPage.routeName;
  //static const String setting = SettingsPage.routeName;

  static getRoutes(BuildContext context) {
    return {
      home: () => const HomePage(),
      //scan: () => const ScanPage(),
      //report: () => const ReportPage(),
      //calendar: () => const CalendarPage(),
      //login: () => LoginPage(),
      //list: () => const ListPage(),
      //setting: () => SettingsPage(),
    };
  }

  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    pages.add(GetPage(name: home, page: () => const HomePage()));
    //pages.add(GetPage(name:scan, page: () => const ScanPage()));
    //pages.add(GetPage(name:report, page: () => const ReportPage()));
    //pages.add(GetPage(name: calendar, page: () => const CalendarPage()));
    //pages.add(GetPage(name: login, page: () => LoginPage()));
    //pages.add(GetPage(name: list, page: () => const ListPage()));
    //pages.add(GetPage(name: setting, page: () => SettingsPage()));

    return pages;
  }
}