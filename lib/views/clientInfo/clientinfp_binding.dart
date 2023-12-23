import 'package:get/get.dart';
import 'package:hume_admin/views/clientInfo/clientinfo_controller.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClientInfoController());
  }
}