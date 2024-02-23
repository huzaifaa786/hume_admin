import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/models/order_item_model.dart';
import 'package:hume_admin/models/shops.dart';

class CombinedOrderProductModel {
  final ProductModel product;
  final Shop shop;
  final OrdersItemsModel ordersItem;

  CombinedOrderProductModel(
      {required this.product, required this.ordersItem, required this.shop});
}
