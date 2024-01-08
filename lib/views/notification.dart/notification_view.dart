// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/notification_box.dart';
import 'package:hume_admin/components/smallbutton.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/notification.dart/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Notification',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.extendedNotifications.length,
                    itemBuilder: (context, index) {
                      final notification =
                          controller.extendedNotifications[index];
                      return NotificationCard(
                        ontap: () {
                          Get.toNamed(AppRoutes.clientinfo, parameters: {
                            'shopName': notification['shopName'],
                            'userId': notification['userId'],
                            'orderId': notification['orderId']
                          });
                        },
                        productDetail: () {
                          Get.toNamed(AppRoutes.order,
                              parameters: {'orderId': notification['orderId']});
                        },
                        content: notification['content'],
                        name: notification['userName'],
                        orderno: notification['orderId'],
                        shopname: notification['shopName'],
                        date: notification['date'],
                      );
                    }),
                // NotificationCard(
                //   ontap: () {
                //     Get.toNamed(AppRoutes.clientinfo);
                //   },
                //   name: 'sdfsdf',
                //   orderno: '45',
                //   shopname: 'sdfsfg',
                //   date: '5/5/4444',
                // ),
                // NotificationCard(
                //   name: 'sdfsdf',
                //   orderno: '45',
                //   shopname: 'sdfsfg',
                //   date: '5/5/4444',
                // ),
                Gap(30),
                Button(
                  buttonWidth: MediaQuery.of(context).size.width * 0.45,
                  buttonheight: 38.0,
                  title: 'Go to Order',
                  onPressed: () {},
                  textcolor: white,
                ),
                Gap(20)
              ],
            ),
          )),
        ),
      ),
    );
  }
}
