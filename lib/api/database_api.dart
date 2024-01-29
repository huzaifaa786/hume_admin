import 'dart:async';

import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hume_admin/exceptions/database_api_exception.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/home_banner_model.dart';
import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/models/shops.dart';

class DatabaseApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _shopsCollection = _firestore.collection("shops");
  final CollectionReference _bannersCollection =
      _firestore.collection("banners");
  final CollectionReference _productsCollection =
      _firestore.collection("products");
  final CollectionReference _ordersCollection = _firestore.collection("orders");
  final CollectionReference _cartCollection = _firestore.collection("carts");
  final CollectionReference _notificationsCollection =
      _firestore.collection("notifications");

  Future<void> createShop(Shop shop) async {
    try {
      await _shopsCollection.doc(shop.id).set(shop.toJson());
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to create Shop',
        message: e.message,
      );
    }
  }

  Future<List<Shop>> fetchShops() async {
    final QuerySnapshot<Object?> snapshot = await _shopsCollection.get();

    final List<Shop> shops = snapshot.docs
        .map((doc) => Shop.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return shops;
  }

  Future deleteShop(String id) async {
    LoadingHelper.show();

    try {
      final batch = FirebaseFirestore.instance.batch();

      // Delete documents from the "products" collection
      final productsQuerySnapshot =
          await _productsCollection.where('shopId', isEqualTo: id).get();
      for (final doc in productsQuerySnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Delete documents from the "orders" collection
      final ordersQuerySnapshot =
          await _ordersCollection.where('shopId', isEqualTo: id).get();
      for (final doc in ordersQuerySnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Delete documents from the "cart" collection
      final cartQuerySnapshot =
          await _cartCollection.where('cartItems.shopId', isEqualTo: id).get();
      for (final doc in cartQuerySnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Delete documents from the "notications" collection
      final notificationQuerySnapshot =
          await _notificationsCollection.where('shopId', isEqualTo: id).get();
      for (final doc in notificationQuerySnapshot.docs) {
        batch.delete(doc.reference);
      }
      // Delete the shop document
      batch.delete(_shopsCollection.doc(id));

      await batch.commit();
      LoadingHelper.dismiss();

      Get.back();
    } on PlatformException catch (e) {
      LoadingHelper.dismiss();
      throw DatabaseApiException(title: 'Failed to delete Shop', message: '');
    }
  }

  Future<List<Shop>> getAllShops() async {
    try {
      QuerySnapshot querySnapshot = await _shopsCollection.get();
      List<Shop> shops = querySnapshot.docs.map((doc) {
        return Shop.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return shops;
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to get Shops',
        message: e.message,
      );
    }
  }

  Future<List<ProductModel>> fetchProducts(id) async {
    final QuerySnapshot<Object?> snapshot =
        await _productsCollection.where('shopId', isEqualTo: id).get();

    final List<ProductModel> products = snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return products;
  }

  Future<Shop?> getShopById(String shopId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _shopsCollection.doc(shopId).get();

      if (documentSnapshot.exists) {
        return Shop.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        return null; // Shop not found
      }
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to get Shop by ID',
      );
    }
  }

  Future<Shop?> editShop(String id) async {
    final QuerySnapshot<Object?> shop =
        await _shopsCollection.where('id', isEqualTo: id).get();
    if (shop.docs.isNotEmpty) {
      final shopData = shop.docs.first.data() as Map<String, dynamic>;
      final shopObject = Shop.fromJson(shopData);

      return shopObject;
    } else {
      return null;
    }
  }

  Future updateShop(Shop shop) async {
    try {
      await _shopsCollection.doc(shop.id).set(shop.toJson());
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to update Shop'.tr,
      );
    }
  }

  Future<void> createBanner(HomeBanner banner) async {
    try {
      await _bannersCollection.doc(banner.id).set(banner.toJson());
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to create Banner',
        message: e.message,
      );
    }
  }
}
