// ignore_for_file: unnecessary_cast, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hume_admin/exceptions/database_api_exception.dart';
import 'package:hume_admin/models/notification_model.dart';

class NotificationApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _notificationCollection =
      _firestore.collection("notifications");
  final CollectionReference _userCollection = _firestore.collection("users");
  final CollectionReference _shopCollection = _firestore.collection("shops");
  final CollectionReference _orderCollection = _firestore.collection("orders");

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _notificationCollection.where('forAdmin', isEqualTo: true).get()
              as QuerySnapshot<Map<String, dynamic>>;
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

  Future<List<String>> fetchUser(String userId) async {
    final user = await _userCollection.where('id', isEqualTo: userId).get();
    if (user.docs.isNotEmpty) {
      final userName = user.docs.first.get('name');
      final email = user.docs.first.get('email');
      final phone = user.docs.first.get('phone');
      return [userName.toString(), email.toString(), phone.toString()];
    } else {
      return [];
    }
  }

  Future<String> fetchShop(String shopId) async {
    final shop = await _shopCollection.where('id', isEqualTo: shopId).get();
    if (shop.docs.isNotEmpty) {
      final shopName = shop.docs.first.get('name');
      return shopName.toString();
    } else {
      return "Shop not found";
    }
  }

  Future<List<String>> fetchOrder(String orderId) async {
    final order = await _orderCollection.where('id', isEqualTo: orderId).get();
    print('order data us here');
    print(order.docs);
    if (order.docs.isNotEmpty) {
      final address = order.docs.first.get('address');
      final total = order.docs.first.get('total');
      return [address, total];
    } else {
      return [];
    }
  }
}
