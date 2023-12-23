// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hume_admin/utils/colors.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    this.name,
   
    this.ontap,
    this.shopname,
    this.orderno,
    this.date,
  });
  final name;
  final ontap;
  final shopname;
  final orderno;
  final date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: cardcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(255, 213, 204, 204),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  New Order  ',
                    style: TextStyle(
                        color: colortext,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        color: maincolor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: ontap,
                child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
