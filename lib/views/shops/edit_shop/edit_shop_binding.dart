import 'package:get/get.dart';
import 'package:hume_admin/views/shops/edit_shop/edit_shop_controller.dart';

class EditShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditShopController());
  }
}