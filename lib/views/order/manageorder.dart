import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/manageorder.dart';
import 'package:hume_admin/components/topbar.dart';

class ManageOrder extends StatefulWidget {
  const ManageOrder({super.key});

  @override
  State<ManageOrder> createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
        children: [
          ManageOrderCard(
            price: '233 AED',
            name: 'ali raxa',
            shopname: 'dsfsfsf',
            orderno: '23',
          ),
          SizedBox(
            height: 5,
          ),
          ManageOrderCard(
            price: '233 AED',
            name: 'ali raxa',
            shopname: 'dsfsfsf',
            orderno: '23',
          ),
        ],
      )),
    );
  }
}
