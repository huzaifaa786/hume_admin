// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/orderhistorycard.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/views/order/order_controller.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {
        Future.delayed(Duration(milliseconds: 10), () {
          state.controller!.fetchCombinedOrderProductList();
        });
      },
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Orders',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.combinedOrderProductList.length,
              itemBuilder: (context, index) {
                final orderItem = controller.combinedOrderProductList[index];
                return OrderHistoryCard(
                  // image: SvgPicture.asset('assets/images/wooo.svg'),
                  image: CachedNetworkImage(imageUrl: orderItem.product.productImageUrls[0],height: 156,width: 137,),
                  price: orderItem.ordersItem.total,
                  size: orderItem.ordersItem.size,
                  name: orderItem.product.productName,
                  quantity: orderItem.ordersItem.quantity,
                );
              },
            );
          }),
        )),
      ),
    );
  }
}
