import 'package:get/get.dart';
import 'package:hume_admin/views/product/editproduct/editproduct_controller.dart';

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProductController());
  }
}
