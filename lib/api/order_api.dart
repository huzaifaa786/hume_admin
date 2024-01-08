import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hume_admin/models/combine_order.dart';
import 'package:hume_admin/models/order_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/models/user_model.dart';

class OrderApi {
  Future<List<OrderCombinedModel>?> fetchOrder(
      DocumentSnapshot? lastDoc) async {
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection('orders');

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
}
