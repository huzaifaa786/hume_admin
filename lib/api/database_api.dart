import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hume_admin/exceptions/database_api_exception.dart';
import 'package:hume_admin/modal/product_model.dart';
import 'package:hume_admin/models/shops.dart';

class DatabaseApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _shopsCollection = _firestore.collection("shops");
  final CollectionReference _productsCollection = _firestore.collection("products");

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

  Future destroy(String id) async {
    try {
      await _shopsCollection.doc(id).delete();
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to delete Shop',
        message: e.message,
      );
    }
  }

  Future<List<ProductModel>> fetchProducts(id)async{

     final QuerySnapshot<Object?> snapshot = await _productsCollection.where('shopId',isEqualTo: id ).get();

    final List<ProductModel> products = snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return products;
  }
}
