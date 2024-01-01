import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume_admin/exceptions/database_api_exception.dart';
import 'package:hume_admin/modal/home_banner_model.dart';
import 'package:hume_admin/models/shops.dart';

class DatabaseApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _shopsCollection = _firestore.collection("shops");
  final CollectionReference _bannersCollection = _firestore.collection("banners");

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
