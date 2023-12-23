import 'package:get/get.dart';
import 'package:hume_admin/views/sale/sale_controller.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaleController());
  }
}