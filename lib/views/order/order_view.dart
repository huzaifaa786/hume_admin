// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/ordercard.dart';
import 'package:hume_admin/components/orderhistorycard.dart';
import 'package:hume_admin/components/topbar.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: TitleTopBar(
          name: 'Order Product',
          ontap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                    children: [
            OrderHistoryCard(
              image: SvgPicture.asset('assets/images/wooo.svg'),
              price: '34',
              size: 'M',
              name: 'sfdrtgertgdrgdfgdf',
              quantity: '34',
            ),
            
              OrderHistoryCard(
              image: SvgPicture.asset('assets/images/wooo.svg'),
              price: '34',
              size: 'M',
              name: 'sfdrtgertgdrgdfgdf',
              quantity: '34',
            )
                    ],
                  ),
          )),
    );
  }
}
