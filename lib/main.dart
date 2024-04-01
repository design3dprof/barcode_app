import 'package:barcode_app/binding/my_binding.dart';
import 'package:barcode_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/my_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      getPages: MyRoutes.getPages(),
      title: 'Barcode App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}