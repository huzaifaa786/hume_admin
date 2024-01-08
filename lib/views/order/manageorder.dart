// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/manageorder.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/views/order/order_controller.dart';
import 'package:intl/intl.dart';

class ManageOrder extends StatefulWidget {
  const ManageOrder({super.key});

  @override
  State<ManageOrder> createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Manage Orders',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: controller.orders.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.orders.length,
                  controller: controller.scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    int timestamp =
                        int.parse(controller.orders[index].order.id);
                    DateTime dateTime =
                        DateTime.fromMillisecondsSinceEpoch(timestamp);
                    String formattedDate =
                        DateFormat('dd/MM/yyyy').format(dateTime);
                    return ManageOrderCard(
                      onSeeProductTap: () {
                        Get.toNamed(AppRoutes.order, parameters: {
                          'id': controller.orders[index].order.id
                        });
                      },
                      onClientInfoTap: () {
                        Get.toNamed(AppRoutes.clientinfo, parameters: {
                          'name': controller.orders[index].order.name!,
                          'phone': controller.orders[index].order.phone!,
                          'address': controller.orders[index].order.address!,
                          'email': controller.orders[index].user.email!,
                        });
                      },
                      onAcceptTap: () {
                        setState(() {
                          controller.orders[index].order.status = '1';
                        });
                        controller
                            .acceptOrder(controller.orders[index].order.id);
                      },
                      onRejectTap: () async {
                        bool i = await controller.rejectOrder(
                            controller.orders[index].order.id,
                            controller.orders[index].order.paymentIntent!);
                        if (i == true) {
                          setState(() {
                            controller.orders[index].order.status = '2';
                          });
                        }
                      },
                      onCompletedTap: () {
                        setState(() {
                          controller.orders[index].order.status = '3';
                        });
                        controller
                            .deliverdOrder(controller.orders[index].order.id);
                      },
                      date: formattedDate,
                      price: controller.orders[index].order.total,
                      name: controller.orders[index].order.name,
                      shopname: controller.orders[index].shop.name,
                      orderno: controller.orders[index].order.id,
                      status: controller.orders[index].order.status,
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
