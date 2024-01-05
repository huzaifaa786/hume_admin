// ignore_for_file: unnecessary_cast, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hume_admin/exceotions/database_exception.dart';
import 'package:hume_admin/models/order_item_model.dart';
import 'package:hume_admin/models/product_model.dart';

class OrderApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _orderItemCollection =
      _firestore.collection("orderItems");
  final CollectionReference _productCollection =
      _firestore.collection("products");

  List<OrderItemModel> orderItems = [];

  Future<List<OrderItemModel>> fetchOrderItems(String orderId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _orderItemCollection.where('orderId', isEqualTo: orderId).get()
              as QuerySnapshot<Map<String, dynamic>>;

      final List<OrderItemModel> fetchedorderItems = snapshot.docs
          .map((doc) =>
              OrderItemModel.fromJson(doc.data() as Map<String, dynamic>))
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
