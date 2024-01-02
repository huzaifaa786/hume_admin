import 'dart:async';

import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hume_admin/exceptions/database_api_exception.dart';
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
    try {
      final querySnapshot =
          await _productsCollection.where('shopId', isEqualTo: id).get();

      if (querySnapshot.docs.isNotEmpty) {
        final batch = FirebaseFirestore.instance.batch();
        for (final doc in querySnapshot.docs) {
          batch.delete(doc.reference);
        }
        batch.delete(_shopsCollection.doc(id)); // Delete the shop as well

        await batch.commit();
        Get.back();
      } else {
        await _shopsCollection.doc(id).delete();
        Get.back();
      }
    } on PlatformException catch (e) {
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

  Future<Shop?> editShop(String id) async {
    final QuerySnapshot<Object?> shop =
        await _shopsCollection.where('id', isEqualTo: id).get();

    // Check if any document is found
    if (shop.docs.isNotEmpty) {
      // Assuming Shop is the model representing your shop data
      final shopData = shop.docs.first.data() as Map<String, dynamic>;
      final shopObject = Shop.fromJson(
          shopData); // Use your model constructor or deserialization logic

      return shopObject;
    } else {
      return null; // Handle the case where no document is found
    }
  }

  Future updateShop(Shop shop) async {
    try {
      await _shopsCollection.doc(shop.id).set(shop.toJson());
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to update Shop',
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
