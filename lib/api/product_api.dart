import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hume_admin/exceotions/database_exception.dart';
import 'package:hume_admin/models/product_model.dart';


class ProductApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _productCollection = _firestore.collection("products");

  Future<void> createProduct(ProductModel product) async {
    try {
      await _productCollection.doc(product.id).set(product.toJson());
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to create product',
        message: e.message,
      );
    }
  }
}
