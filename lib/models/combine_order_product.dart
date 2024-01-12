import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/models/order_item_model.dart';

class CombinedOrderProductModel {

  final ProductModel product;
  final OrdersItemsModel ordersItem;

  CombinedOrderProductModel({required this.product,required this.ordersItem});
}