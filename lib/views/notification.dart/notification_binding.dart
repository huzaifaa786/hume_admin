import 'package:get/get.dart';
import 'package:hume_admin/views/notification.dart/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}