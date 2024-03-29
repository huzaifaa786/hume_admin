// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/utils/colors.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key,
      this.name,
      this.ontap,
      this.shopname,
      this.onSeeProductTap,
      this.onClientInfoTap,
      this.orderno,
      this.date,
      this.price});
  final name;
  final ontap;
  final shopname;
  final orderno;
  final date;
  final onClientInfoTap;
  final price;
  final onSeeProductTap;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: hintcolor.withOpacity(0.35),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 12, right: 20, top: 8, bottom: 8),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: onClientInfoTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/images/head.svg'),
                              SizedBox(
                                width: Get.width * 0.35,
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'See client info    '.tr,
                                style: TextStyle(
                                    color: colortext,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              SvgPicture.asset('assets/images/arrow.svg')
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: onSeeProductTap,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  // height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/order.svg',
                                height: 20,
                                width: 23,
                              ),
                              Gap(4),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.35,
                                    child: Text(
                                      'Order NO  $orderno'.tr,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'See product info    '.tr,
                                style: TextStyle(
                                    color: colortext,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              SvgPicture.asset('assets/images/arrow.svg')
                            ],
                          )
                        ],
                      ),
                      Gap(8),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/home.svg',
                                height: 23,
                                width: 23,
                              ),
                              Text(
                                shopname,
                                style: TextStyle(
                                  color: colortext,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Directionality(
                textDirection: box.read('locale') == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Row(
                  children: [
                    Text(
                      '       Requested'.tr,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                    Text('$date', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Directionality(
                textDirection: box.read('locale') == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Row(
                  children: [
                    Text(
                      '        Total Price'.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                    Text(price,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
