import 'package:hume_admin/models/notification_model.dart';
import 'package:hume_admin/models/order_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/models/user_model.dart';

class NotificationCombinedModel {
  final NotificationModel notification;
  final OrderModel order;
  final Shop shop;
  final UserModel user;

  NotificationCombinedModel(
      {required this.order,
      required this.shop,
      required this.user,
      required this.notification});
}
