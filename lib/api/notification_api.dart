// ignore_for_file: unnecessary_cast, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hume_admin/exceptions/database_api_exception.dart';
import 'package:hume_admin/models/notification_model.dart';
import 'package:hume_admin/models/order_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/models/user_model.dart';

class NotificationApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _notificationCollection =
      _firestore.collection("notifications");

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _notificationCollection
              .where('forAdmin', isEqualTo: true)
              .orderBy('notificationId', descending: true)
              .get() as QuerySnapshot<Map<String, dynamic>>;
      final List<NotificationModel> notifications = snapshot.docs
          .map((doc) =>
              NotificationModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return notifications;
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to fetch notifications',
        message: e.message,
      );
    }
  }

  Future<Shop> fetchShop(String shopId) async {
    final shopSnapshot =
        await FirebaseFirestore.instance.collection('shops').doc(shopId).get();
    print(shopSnapshot.data().toString());
    final shopData = shopSnapshot.data() as Map<String, dynamic>;
    return Shop.fromJson(shopData);
  }

  Future<UserModel> fetchUser(String userId) async {
    final userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    final userData = userSnapshot.data() as Map<String, dynamic>;
    return UserModel.fromJson(userData);
  }

  Future<OrderModel> fetchOrder(String orderId) async {
    final orderSnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .get();
    final orderData = orderSnapshot.data() as Map<String, dynamic>;
    return OrderModel.fromJson(orderData);
  }

  void storeNotification(NotificationModel notification) {
    var collectionReference =
        FirebaseFirestore.instance.collection('notifications');
    var documentReference =
        collectionReference.doc(notification.notificationId);
    documentReference.set({
      'notificationId': notification.notificationId,
      'userId': notification.userId,
      'shopId': notification.shopId,
      'orderId': notification.orderId,
      'content': notification.content,
      'forAdmin': notification.forAdmin,
      'seen': notification.seen,
    }).then((value) {
      print('Notification stored successfully');
    }).catchError((error) {
      print('Error storing notification: $error');
    });
  }
}
