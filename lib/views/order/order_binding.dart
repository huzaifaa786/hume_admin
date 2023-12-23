import 'package:get/get.dart';
import 'package:hume_admin/views/order/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
  }
}