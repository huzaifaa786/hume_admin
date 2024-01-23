import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/notification_api.dart';
import 'package:hume_admin/api/order_api.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/combine_order.dart';
import 'package:hume_admin/models/combine_order_product.dart';
import 'package:hume_admin/models/notification_model.dart';
import 'package:hume_admin/models/order_item_model.dart';
import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/services/notification_service.dart';
import 'package:hume_admin/services/payment_service.dart';
import 'package:hume_admin/utils/ui_utils.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  final scrollController = ScrollController();
  final OrderApi orderApi = OrderApi();
  final NotificationApi notificationApi = NotificationApi();
  DocumentSnapshot? lastDocument;
  List<OrderCombinedModel> orders = [];
  String category = 'New arrivals';
  final paymentService = PaymentService();
  final notificationService = NotificationService();

  @override
  void onInit() {
    fetchOrders();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  void scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollThreshold = maxScroll * 0.99;

    if (currentScroll >= scrollThreshold) {
      if (lastDocument != null) {
        fetchOrders();
        lastDocument = null;
      }
    }
  }

  fetchOrders() async {
    List<OrderCombinedModel>? newItems =
        await orderApi.fetchOrder(lastDocument);

    if (newItems!.isNotEmpty) {
      lastDocument = newItems.last.lastDoc;
    }

    orders.addAll(newItems);
    update();
  }

  acceptOrder(id, userId, shopId, token) async {
    LoadingHelper.show();
    FirebaseFirestore.instance.collection('orders').doc(id).update(
      {'status': '1'},
    );
    String notiId = DateTime.now().millisecondsSinceEpoch.toString();
    notificationApi.storeNotification(NotificationModel(
        notificationId: notiId,
        orderId: id,
        userId: userId,
        shopId: shopId,
        content: 'Accepted order',
        forAdmin: false,
        seen: false));
    await notificationService.postNotification(
        title: 'Order Accepted',
        body: 'Your order has been accepted with Order Id #$id.',
        receiverToken: token);

    LoadingHelper.dismiss();
    update();
  }

  Future<bool> rejectOrder(
      String id, String paymentIntent, userId, shopId, token) async {
    LoadingHelper.show();
    String paymentIntentId = extractId(paymentIntent);
    bool isSuccess = false;

    var refundResult = await paymentService.refundPayment(paymentIntentId);
    if (refundResult == true) {
      await FirebaseFirestore.instance.collection('orders').doc(id).update(
        {'status': '2'},
      );
      String notiId = DateTime.now().millisecondsSinceEpoch.toString();
      print(notiId);
      notificationApi.storeNotification(NotificationModel(
          notificationId: notiId,
          orderId: id,
          userId: userId,
          shopId: shopId,
          content: 'Rejected order',
          forAdmin: false,
          seen: false));
      await notificationService.postNotification(
          title: 'Order Rejected',
          body:
              'Order with Order Id #$id has been rejected and your payment has been refunded to your accout.',
          receiverToken: '');

      isSuccess = true;
      update();
    } else {
      UiUtilites.errorSnackbar(
        'Error!',
        'Error during refund. Please try again later',
      );
    }
    LoadingHelper.dismiss();
    update();
    return isSuccess;
  }

  RxList<CombinedOrderProductModel> combinedOrderProductList =
      <CombinedOrderProductModel>[].obs;
  Future<void> fetchCombinedOrderProductList() async {
    combinedOrderProductList = <CombinedOrderProductModel>[].obs;
    update();
    LoadingHelper.show();
    var id = Get.parameters['id'];
    var orderItemsSnapshot = await FirebaseFirestore.instance
        .collection('orderItems')
        .where('orderId', isEqualTo: id)
        .get();
    if (orderItemsSnapshot.docs.isEmpty) {
      print('No order items found for ID: $id');
      LoadingHelper.dismiss();
      return;
    }

    List<OrdersItemsModel> orderItemList = [];

    for (var doc in orderItemsSnapshot.docs) {
      final data = doc.data();
      OrdersItemsModel orderItem = OrdersItemsModel.fromJson(data);
      orderItemList.add(orderItem);
    }
    for (final orderItem in orderItemList) {
      final productId = orderItem.productId;

      final productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();
      final product =
          ProductModel.fromJson(productSnapshot.data() as Map<String, dynamic>);

      final combinedOrderProduct =
          CombinedOrderProductModel(product: product, ordersItem: orderItem);

      combinedOrderProductList.add(combinedOrderProduct);
      LoadingHelper.dismiss();
    }
    update();
  }

  String extractId(String paymentIntent) {
    int start = paymentIntent.indexOf("id:") + 4;
    int end = paymentIntent.indexOf(",", start);

    if (start != -1 && end != -1) {
      return paymentIntent.substring(start, end).trim();
    } else {
      LoadingHelper.dismiss();
      return "ID not found";
    }
  }

  deliverdOrder(id, userId, shopId, token) async {
    LoadingHelper.show();
    FirebaseFirestore.instance.collection('orders').doc(id).update(
      {'status': '3'},
    );
    print(token);
    String notiId = DateTime.now().millisecondsSinceEpoch.toString();
    notificationApi.storeNotification(NotificationModel(
        notificationId: notiId,
        orderId: id,
        userId: userId,
        shopId: shopId,
        content: 'Deliverd order',
        forAdmin: false,
        seen: false));
    await notificationService.postNotification(
        title: 'Order Delivered',
        body:
            'Order with Order Id #$id delivered successfully on your provided destination.',
        receiverToken: token);
    LoadingHelper.dismiss();
    update();
  }
}
