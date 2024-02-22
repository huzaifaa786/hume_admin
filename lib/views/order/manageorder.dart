// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hume_admin/components/manageorder.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/views/order/order_controller.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class ManageOrder extends StatefulWidget {
  const ManageOrder({super.key});

  @override
  State<ManageOrder> createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) => Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            title: TitleTopBar(
              name: 'Manage Orders'.tr,
              ontap: () {
                Get.back();
              },
            ),
          ),
          body: Directionality(
            textDirection: box.read('locale') == 'ar'
                ? ui.TextDirection.rtl
                : ui.TextDirection.ltr,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    !controller.islodaing
                        ? controller.orders.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller.orders.length,
                                controller: controller.scrollController,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  int timestamp = int.parse(
                                      controller.orders[index].order.id);
                                  DateTime dateTime =
                                      DateTime.fromMillisecondsSinceEpoch(
                                          timestamp);
                                  String formattedDate =
                                      DateFormat('dd/MM/yyyy').format(dateTime);
                                  return ManageOrderCard(
                                    onSeeProductTap: () {
                                      Get.toNamed(AppRoutes.order, parameters: {
                                        'id': controller.orders[index].order.id
                                      });
                                    },
                                    onClientInfoTap: () {
                                      Get.toNamed(AppRoutes.clientinfo,
                                          parameters: {
                                            'name': controller
                                                .orders[index].order.name!,
                                            'phone': controller
                                                .orders[index].order.phone!,
                                            'address': controller
                                                .orders[index].order.address!,
                                            'email': controller
                                                .orders[index].user.email!,
                                          });
                                    },
                                    onAcceptTap: () {
                                      setState(() {
                                        controller.orders[index].order.status =
                                            '1';
                                      });
                                      controller.acceptOrder(
                                          controller.orders[index].order.id,
                                          controller.orders[index].user.id,
                                          controller.orders[index].shop.id,
                                          controller.orders[index].user.token);
                                    },
                                    onRejectTap: () async {
                                      bool i = await controller.rejectOrder(
                                          controller.orders[index].order.id,
                                          controller.orders[index].order
                                              .paymentIntent!,
                                          controller.orders[index].user.id,
                                          controller.orders[index].shop.id,
                                          controller.orders[index].user.token);
                                      if (i == true) {
                                        setState(() {
                                          controller
                                              .orders[index].order.status = '2';
                                        });
                                      }
                                    },
                                    onCompletedTap: () {
                                      setState(() {
                                        controller.orders[index].order.status =
                                            '3';
                                      });
                                      controller.deliverdOrder(
                                          controller.orders[index].order.id,
                                          controller.orders[index].user.id,
                                          controller.orders[index].shop.id,
                                          controller.orders[index].user.token);
                                    },
                                    date: formattedDate,
                                    price: controller.orders[index].order.total,
                                    name: controller.orders[index].order.name,
                                    // shopname: controller.orders[index].shop.name,
                                    orderno: controller.orders[index].order.id,
                                    status:
                                        controller.orders[index].order.status,
                                  );
                                },
                              )
                            : Center(
                                child: Text(''),
                              )
                        : SizedBox(
                            height: Get.height * 0.8,
                            width: Get.width,
                            child: const Center(
                                child: CircularProgressIndicator())),
                    controller.isBottomLoading == true
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
