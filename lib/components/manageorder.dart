// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/components/orderbutton.dart';
import 'package:hume_admin/utils/colors.dart';

class ManageOrderCard extends StatelessWidget {
  const ManageOrderCard(
      {super.key,
      this.name,
      this.onClientInfoTap,
      this.shopname,
      this.onSeeProductTap,
      this.orderno,
      this.date,
      this.onCompletedTap,
      this.price,
      this.onAcceptTap,
      this.onRejectTap,
      this.status});
  final name;
  final onClientInfoTap;
  final onSeeProductTap;
  final shopname;
  final orderno;
  final price;
  final status;
  final date;
  final onCompletedTap;
  final onAcceptTap;
  final onRejectTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: hintcolor.withOpacity(0.35),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: onClientInfoTap,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 12, right: 20, top: 8, bottom: 8),
                  width: MediaQuery.of(context).size.width * 0.9,
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
                              SvgPicture.asset('assets/images/head.svg'),
                              Text(
                                name,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'See client info'.tr,
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
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
                                  Text(
                                    'Order NO  $orderno'.tr,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'See Products'.tr,
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
              Row(
                children: [
                  Text(
                    '       Requested'.tr,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Text(date, style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
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
                  Text(price + ' AED'.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              status == '0'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OrderButton(
                          onPressed: onAcceptTap,
                          bordercolor: colortext,
                          text: 'Accept order'.tr,
                          textcolor: colortext,
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                        OrderButton(
                          onPressed: onRejectTap,
                          width: MediaQuery.of(context).size.width * 0.25,
                          bordercolor: const Color.fromARGB(255, 226, 117, 109),
                          text: 'Reject Order'.tr,
                          textcolor: Colors.red,

                          // color: ,
                        ),
                      ],
                    )
                  : status == '1'
                      ? OrderButton(
                          width: MediaQuery.of(context).size.width * 0.26,
                          bordercolor: colortext,
                          text: 'Mark as delivred'.tr,
                          color: colortext,
                          textcolor: white,
                          icon: SvgPicture.asset('assets/images/tickk.svg'),
                          onPressed: onCompletedTap,
                          // color: ,
                        )
                      : status == '2'
                          ? OrderButton(
                              width: MediaQuery.of(context).size.width * 0.26,
                              bordercolor: Colors.red,
                              color: Colors.red,
                              text: 'Rejected'.tr,
                              textcolor: white,
                              icon: SvgPicture.asset('assets/images/cross.svg'),

                              // color: ,
                            )
                          : OrderButton(
                              width: MediaQuery.of(context).size.width * 0.26,
                              bordercolor: maincolor,
                              color: maincolor,
                              text: 'Delivered'.tr,
                              textcolor: white,
                              icon: SvgPicture.asset('assets/images/cross.svg'),
                            ),
              Gap(30)
            ],
          ),
        ),
      ),
    );
  }
}
