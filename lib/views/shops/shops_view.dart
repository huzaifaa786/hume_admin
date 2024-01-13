// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/components/icon_button.dart';
import 'package:hume_admin/components/shopcard.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/shops/shops_controller.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (controller) => Scaffold(
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
                  ).translate(),
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
                      controller.clear();
                      Get.toNamed(AppRoutes.addshop)!
                          .then((value) => controller.fetchShop());
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
              Expanded(
                child: ListView.builder(
                    itemCount: controller.shops.length,
                    itemBuilder: (context, index) {
                      final shop = controller.shops[index];
                      return ShopCard(
                          name: shop.name,
                          image: shop.logoImageUrl,
                          ontap: () {
                            Get.toNamed(AppRoutes.allproduct,
                                parameters: {'id': shop.id, 'shopname': shop.name.toString()});
                          },
                          category: shop.category,
                          updateShop: () {
                            Get.toNamed(AppRoutes.editshop,
                                    parameters: {'id': shop.id})!
                                .then((value) => controller.fetchShop());
                          },
                          onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text('Are you sure!').translate(),
                                    content: Text(
                                        'You are going to delete the shop and all its products').translate(),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: Text('Cancel').translate(),
                                      ),
                                      TextButton(
                                          onPressed: () =>
                                              controller.deleteShop(shop.id),
                                          child: Text('Delete').translate())
                                    ],
                                  )));
                    }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
