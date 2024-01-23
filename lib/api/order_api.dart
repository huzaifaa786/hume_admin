import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hume_admin/exceotions/database_exception.dart';
import 'package:hume_admin/models/combine_order.dart';
import 'package:hume_admin/models/order_item_model.dart';
import 'package:hume_admin/models/order_model.dart';
import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/models/user_model.dart';

class OrderApi {
  Future<List<OrderCombinedModel>?> fetchOrder(
      DocumentSnapshot? lastDoc) async {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('orders')
        .orderBy('id', descending: true);

    if (lastDoc != null) {
      query = query.startAfterDocument(lastDoc);
    }

    QuerySnapshot<Map<String, dynamic>> orderDocSnapshot =
        await query.limit(10).get();
    print(orderDocSnapshot);
    if (orderDocSnapshot.size > 0) {
      final orders = orderDocSnapshot.docs.map((doc) => doc.data()).toList();

      List<OrderCombinedModel> combinedOrders = [];

      for (final orderData in orders) {
        final userId = orderData['userId'];
        final shopId = orderData['shopId'];

        final userDocSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        final shopDocSnapshot = await FirebaseFirestore.instance
            .collection('shops')
            .doc(shopId)
            .get();

        if (userDocSnapshot.exists && shopDocSnapshot.exists) {
          final userData = userDocSnapshot.data();
          final shopData = shopDocSnapshot.data();
          final order = OrderModel.fromJson(orderData);
          final user = UserModel.fromJson(userData!);
          final shop = Shop.fromJson(shopData!);
          final lastDoc = orderDocSnapshot.docs.last;

          combinedOrders.add(OrderCombinedModel(
              order: order, shop: shop, user: user, lastDoc: lastDoc));
        }
      }
      print(combinedOrders);
      return combinedOrders;
    }
    return [];
  }

  Future<List<OrderCombinedModel>?> fetchOrderbyTrainer(String id) async {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('orders')
        .where('shopId', isEqualTo: id)
        .orderBy('id', descending: true);

    QuerySnapshot<Map<String, dynamic>> orderDocSnapshot = await query.get();
    if (orderDocSnapshot.size > 0) {
      final orders = orderDocSnapshot.docs.map((doc) => doc.data()).toList();

      List<OrderCombinedModel> combinedOrders = [];

      for (final orderData in orders) {
        final userId = orderData['userId'];
        final shopId = orderData['shopId'];

        final userDocSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        final shopDocSnapshot = await FirebaseFirestore.instance
            .collection('shops')
            .doc(shopId)
            .get();

        if (userDocSnapshot.exists && shopDocSnapshot.exists) {
          final userData = userDocSnapshot.data();
          final shopData = shopDocSnapshot.data();
          final order = OrderModel.fromJson(orderData);
          final user = UserModel.fromJson(userData!);
          final shop = Shop.fromJson(shopData!);
          final lastDoc = orderDocSnapshot.docs.last;

          combinedOrders.add(OrderCombinedModel(
              order: order, shop: shop, user: user, lastDoc: lastDoc));
        }
      }
      print(combinedOrders);
      return combinedOrders;
    }
    return [];
  }

  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _orderItemCollection =
      _firestore.collection("orderItems");
  final CollectionReference _productCollection =
      _firestore.collection("products");

  List<OrdersItemsModel> orderItems = [];

  Future<List<OrdersItemsModel>> fetchOrderItems(String orderId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _orderItemCollection.where('orderId', isEqualTo: orderId).get()
              as QuerySnapshot<Map<String, dynamic>>;

      final List<OrdersItemsModel> fetchedorderItems = snapshot.docs
          .map((doc) =>
              OrdersItemsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return fetchedorderItems;
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to fetch order items',
        message: e.message,
      );
    }
  }

  Future<ProductModel?> fetchProduct(String productId) async {
    final QuerySnapshot<Object?> product =
        await _productCollection.where('id', isEqualTo: productId).get();
    if (product.docs.isNotEmpty) {
      final productData = product.docs.first.data() as Map<String, dynamic>;
      final productObject = ProductModel.fromJson(productData);

      return productObject;
    } else {
      return null;
    }
  }
}
