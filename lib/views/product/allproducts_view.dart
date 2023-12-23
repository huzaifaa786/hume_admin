// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/ordercard.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/order/order_view.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Trendy fashion shop',
            ontap: () {
              Get.back();
            },
          ),
          bottom: TabBar(
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicatorWeight: 0.4,
              indicatorColor: maincolor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Product',
                        style: TextStyle(
                          fontSize: 16,
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
                          fontSize: 16,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'All Product',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/man.png'),
                          Text(
                            'Wooden Table',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'AED 250',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: maincolor),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/woman.png'),
                          Text(
                            'Wooden Table',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'AED 250',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: maincolor),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/man.png'),
                          Text(
                            'Wooden Table',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'AED 250',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: maincolor),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/woman.png'),
                          Text(
                            'Wooden Table',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'AED 250',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: maincolor),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            //  OrderCard(
            //           price: '233 AED',
            //           name: 'ali raxa',
            //           shopname: 'dsfsfsf',
            //           orderno: '23',
            //         )
            ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => OrderCard(
                      price: '233 AED',
                      name: 'ali raxa',
                      shopname: 'dsfsfsf',
                      orderno: '23',
                    )),
          ],
        ),
      ),
    );
  }
}
