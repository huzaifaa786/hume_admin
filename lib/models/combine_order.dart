import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hume_admin/models/order_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/models/user_model.dart';

class OrderCombinedModel {
  final OrderModel order;
  final Shop shop;
  final UserModel user;
  final DocumentSnapshot lastDoc; 

  OrderCombinedModel({required this.order, required this.shop,required this.user,required this.lastDoc});
  // OrderCombinedModel({required this.order, required this.user,required this.lastDoc});

}