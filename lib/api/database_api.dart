import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume_admin/exceptions/database_api_exception.dart';
import 'package:hume_admin/models/shops.dart';

class DatabaseApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _shopsCollection = _firestore.collection("shops");

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
}
