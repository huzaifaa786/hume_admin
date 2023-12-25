// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/icon_button.dart';
import 'package:hume_admin/components/shopcard.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: TitleTopBar(
          name: 'Manage Shops',
          ontap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Shops',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                IconsButton(
                  width: MediaQuery.of(context).size.width * 0.5,
                  imgicon: Icon(
                    Icons.add,
                    color: white,
                  ),
                  fontSize: 14.0,
                  title: 'Add New Shop',
                  height: 45.0,
                  textcolor: white,
                  color: maincolor,
                  onPressed: () {
                    Get.toNamed(AppRoutes.addshop);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                ShopCard(
                  name: 'ali',
                  ontap: () {
                    Get.toNamed(AppRoutes.allproduct);
                  },
                  category: 'Clothes brand',
                ),
                ShopCard(
                  name: 'ali',
                  ontap: () {},
                  category: 'Clothes brand',
                ),
                ShopCard(
                  name: 'ali',
                  ontap: () {},
                  category: 'Clothes brand',
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
