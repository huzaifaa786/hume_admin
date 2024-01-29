import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hume_admin/exceotions/database_exception.dart';
import 'package:hume_admin/models/combine_order.dart';
import 'package:hume_admin/models/order_model.dart';
import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/models/user_model.dart';

class ProductApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _productCollection =
      _firestore.collection("products");
  final CollectionReference _orderItemCollection =
      _firestore.collection("orderItems");
  final CollectionReference _cartCollection = _firestore.collection("carts");

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

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _productCollection.get() as QuerySnapshot<Map<String, dynamic>>;
      final List<ProductModel> products = snapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return products;
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to fetch products',
        message: e.message,
      );
    }
  }

  Future<ProductModel?> getProductById(String productId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> doc =
          await _productCollection.doc(productId).get()
              as DocumentSnapshot<Map<String, dynamic>>;

      if (doc.exists) {
        return ProductModel.fromJson(doc.data()!);
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to fetch product by ID',
        message: e.message,
      );
    }
  }

  Future<void> updateProduct(productId, product) async {
    try {
      await _productCollection.doc(productId).update(product.toJson());
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to update product',
        message: e.message,
      );
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _cartCollection
          .where('cartItems.productId', isEqualTo: productId)
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
      await _orderItemCollection
          .where('productId', isEqualTo: productId)
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
      await _productCollection.doc(productId).delete();
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to delete product',
        message: e.message,
      );
    }
  }
}
