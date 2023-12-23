// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hume_admin/components/orderbutton.dart';
import 'package:hume_admin/components/smallbutton.dart';
import 'package:hume_admin/utils/colors.dart';

class ManageOrderCard extends StatelessWidget {
  const ManageOrderCard(
      {super.key,
      this.name,
      this.ontap,
      this.shopname,
      this.orderno,
      this.price});
  final name;
  final ontap;
  final shopname;
  final orderno;
  final price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.98,
        height: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: hintcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.15,
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
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'See clinet info    ',
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
              SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(14.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.2,
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
                              height: 23,
                            ),
                            Row(
                              children: [
                                Text(
                                  '  Order NO  ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: colortext),
                                ),
                                Text(
                                  orderno,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: colortext),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'See clinet info    ',
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
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/home.svg',
                              height: 23,
                            ),
                            Text(
                              shopname,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    '       Requested',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Text('22/11/2023', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    '        Total Price',
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
                SizedBox(
                    height: 23,
                  ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    OrderButton(
                      bordercolor: colortext,
                      text: 'accept order',
                      textcolor: colortext,
                      width: MediaQuery.of(context).size.width * 0.21,
                
                      // color: ,
                    ),
                    OrderButton(
                      width: MediaQuery.of(context).size.width * 0.256,
                      bordercolor: colortext,
                      text: 'Mark as delivred',
                      color: colortext,
                      textcolor: white,
                      icon: SvgPicture.asset('assets/images/tickk.svg'),
                
                      // color: ,
                    ),
                    OrderButton(
                      width: MediaQuery.of(context).size.width * 0.21,
                      bordercolor: const Color.fromARGB(255, 226, 117, 109),
                      text: 'Order Reject',
                      textcolor: Colors.red,
                
                      // color: ,
                    ),
                    OrderButton(
                          width: MediaQuery.of(context).size.width * 0.25,
                      bordercolor: Colors.red,
                      color: Colors.red,
                      text: 'Mark as Rejected',
                      textcolor: white,
                      icon: SvgPicture.asset('assets/images/cross.svg'),
                
                      // color: ,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
