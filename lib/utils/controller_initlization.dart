import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hume_admin/services/auth_service.dart';
import 'package:hume_admin/views/addbaner/addbanner_controller.dart';
import 'package:hume_admin/views/clientInfo/clientinfo_controller.dart';
import 'package:hume_admin/views/notification.dart/notification_controller.dart';
import 'package:hume_admin/views/order/order_controller.dart';
import 'package:hume_admin/views/product/editproduct/editproduct_controller.dart';
import 'package:hume_admin/views/product/product_controller.dart';
import 'package:hume_admin/views/home/home_controller.dart';
import 'package:hume_admin/views/sale/sale_controller.dart';
import 'package:hume_admin/views/shops/shops_controller.dart';
import 'package:hume_admin/views/splash/splash_controller.dart';

SplashController splashController = SplashController.instance;
HomeController homeController = HomeController.instance;
SaleController saleController = SaleController.instance;
ShopController shopController = ShopController.instance;
ProductController productController = ProductController.instance;
OrderController orderController = OrderController.instance;
AuthService authService = AuthService.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
NotificationController notificationController = NotificationController.instance;
ClientInfoController clientInfoController = ClientInfoController.instance;
EditProductController editProductController = EditProductController.instance;
