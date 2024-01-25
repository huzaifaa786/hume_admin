// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/utils/colors.dart';

class ClientInfoScreen extends StatefulWidget {
  const ClientInfoScreen({super.key});

  @override
  State<ClientInfoScreen> createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'client info'.tr,
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: hintcolor.withOpacity(0.35),
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/head.svg',
                          height: 65,
                          width: 65,
                        ),
                        Gap(4),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${Get.parameters['name']}',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: colortext),
                              ),
                              // Text(
                              //   'dfsdfsdf',
                              //   style: TextStyle(color: Colors.grey),
                              // )
                            ]),
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/message.svg'),
                        Text('  ${Get.parameters['email']}',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/phone.svg'),
                        Text('  ${Get.parameters['phone']}',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/location.svg'),
                        Text('  ${Get.parameters['address']}',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Gap(12),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 13),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Orders",
            //         style: const TextStyle(
            //           fontFamily: "Poppins",
            //           fontSize: 15,
            //           fontWeight: FontWeight.w700,
            //           color: Color(0xff000000),
            //           height: 23 / 15,
            //         ),
            //         textAlign: TextAlign.left,
            //       ),
            //       InfoCard(
            //         ontap: () {
            //           Get.toNamed(AppRoutes.order);
            //         },
            //         price: '233 AED',
            //         shopname: 'dsfsfsf',
            //         orderno: '23',
            //       ),
            //     ],
            //   ),
            // )
          ],
        )),
      ),
    );
  }
}
