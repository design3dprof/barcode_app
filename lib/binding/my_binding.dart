

import 'package:barcode_app/controller/item_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemController(), fenix: true);
  }
}