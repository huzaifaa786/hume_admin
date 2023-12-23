import 'package:get/get.dart';
import 'package:hume_admin/views/addbaner/addbanner_controller.dart';

class AddBannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBannerController());
  }
}