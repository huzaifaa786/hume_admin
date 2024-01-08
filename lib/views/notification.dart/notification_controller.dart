// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:hume_admin/api/notification_api.dart';
import 'package:hume_admin/models/notification_model.dart';
import 'package:intl/intl.dart';

class NotificationController extends GetxController {
  static NotificationController instance = Get.find();

  final _notificationApi = NotificationApi();
  List<NotificationModel> fetchednotifications = [];
  List<Map<String, dynamic>> extendedNotifications = [];

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
    update();
  }

  fetchNotifications() async {
    fetchednotifications = await _notificationApi.fetchNotifications();
    for (var notification in fetchednotifications) {
      final shopName = await _notificationApi.fetchShop(notification.shopId);
      final user = await _notificationApi.fetchUser(notification.userId);

      int millisecondsSinceEpoch = int.parse(notification.notificationId);
      int secondsSinceEpoch = millisecondsSinceEpoch ~/ 1000;
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(secondsSinceEpoch * 1000);
      String date = DateFormat("dd/MM/yyyy").format(dateTime);

      final extendedNotification = {
        'content': notification.content,
        'shopName': shopName,
        'userName': user[0],
        'userId': notification.userId,
        'orderId': notification.orderId,
        'date' : date,
      };
      extendedNotifications.add(extendedNotification);
    }
    update();
  }
}
