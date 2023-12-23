import 'package:get/get.dart';
import 'package:hume_admin/views/product/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}