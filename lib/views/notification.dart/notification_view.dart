// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/notification_box.dart';
import 'package:hume_admin/components/smallbutton.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/utils/date_time_convertion.dart';
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
                      var date = convertTimestampToDate(notification.order.id);
                      return NotificationCard(
                        ontap: () {
                          Get.toNamed(AppRoutes.clientinfo, parameters: {
                            'name': notification.order.name!,
                            'phone': notification.order.phone!,
                            'address': notification.order.address!,
                            'email': notification.user.email!,
                          });
                        },
                        productDetail: () {
                          Get.toNamed(AppRoutes.order,
                              parameters: {'id': notification.order.id});
                        },
                        content: notification.notification.content,
                        name: notification.user.name,
                        orderno: notification.order.id,
                        shopname: notification.shop.name,
                        date: date,
                      );
                    }),
                Gap(30),
                Button(
                  buttonWidth: MediaQuery.of(context).size.width * 0.45,
                  buttonheight: 38.0,
                  title: 'Go to Order',
                  onPressed: () {
                    Get.toNamed(AppRoutes.manageorder);
                  },
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
