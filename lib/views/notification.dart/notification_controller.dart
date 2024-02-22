// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:hume_admin/api/notification_api.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/combined_notifications.dart';
import 'package:hume_admin/models/notification_model.dart';
// import 'package:intl/intl.dart';

class NotificationController extends GetxController {
  static NotificationController instance = Get.find();

  final _notificationApi = NotificationApi();
  List<NotificationModel> fetchednotifications = [];
  List<NotificationCombinedModel> extendedNotifications = [];

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
    update();
  }

  fetchNotifications() async {
    LoadingHelper.show();
    fetchednotifications = await _notificationApi.fetchNotifications();
    print(fetchednotifications);
    for (var notification in fetchednotifications) {
      print(notification.shopId);
      print(notification.userId);
      print(notification.orderId);
      final shop = await _notificationApi.fetchShop(notification.shopId);
      print(shop);
      final user = await _notificationApi.fetchUser(notification.userId);
      print(user);

      final order = await _notificationApi.fetchOrder(notification.orderId);
      print(order);

      final combinedNotification = NotificationCombinedModel(
        notification: notification,
        order: order,
        shop: shop,
        user: user,
      );
      print(combinedNotification);
      extendedNotifications.add(combinedNotification);
    }
    LoadingHelper.dismiss();
    update();
  }
}
