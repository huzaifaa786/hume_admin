import 'package:get/get.dart';

import 'package:hume_admin/views/shops/shops_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopController());
  }
}