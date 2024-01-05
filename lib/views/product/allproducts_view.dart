// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/ordercard.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';

import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/product/product_controller.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<ProductController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            title: TitleTopBar(
              name: Get.parameters['shopname'],
              ontap: () {
                Get.back();
              },
            ),
            bottom: TabBar(
                isScrollable: false,
                dividerColor: Colors.transparent,
                indicatorWeight: 0.4,
                indicatorColor: maincolor.withOpacity(0.8),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Products & sales',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order History',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              controller.shopProducts.isEmpty
                  ? Center(child: Text('No products found!'))
                  : Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 290),
                        itemCount: controller.shopProducts.length,
                        itemBuilder: (context, index) {
                          final product = controller.shopProducts[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product.productImageUrls[0],
                                height: 244,
                              ),
                              // Image.asset(
                              //   'assets/images/woman.png',
                              //   height: 244,
                              // ),
                              Text(
                                product.productName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'AED ' + product.productPrice.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: maincolor),
                              )
                            ],
                          );
                        },
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 290),
                  itemCount: controller.shopProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.shopProducts[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.editproduct,
                            parameters: {'id': product.id});
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            product.productImageUrls[0],
                            height: 240,
                            width: Get.width * 0.4,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            product.productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'AED ' + product.productPrice.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: maincolor),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => OrderCard(
                  price: '233 AED',
                  name: 'Ali raza',
                  shopname: 'Trendy Fashion',
                  orderno: '23',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
