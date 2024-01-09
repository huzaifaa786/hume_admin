// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:hume_admin/api/notification_api.dart';

class ClientInfoController extends GetxController {
  static ClientInfoController instance = Get.find();

  final _notificationApi = NotificationApi();
  final userId = Get.parameters['userId'].toString();
  final orderId = Get.parameters['orderId'].toString();

  String name = '';
  String email = '';
  String phone = '';
  String address = '';
  String shopName = '';
  String total = '';

  @override
  void onInit() {
    super.onInit();
    index();
    update();
  }

  index() async {
    final user = await _notificationApi.fetchUser(userId);
    final order = await _notificationApi.fetchOrder(orderId);
    name = user.name.toString();
    email = user.email.toString();
    phone = order.phone.toString();
    address = order.address.toString();
    total = order.total.toString();
    shopName = Get.parameters['shopName'].toString();
    update();
  }
}
