import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/infocard.dart';
import 'package:hume_admin/components/ordercard.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';

class ClientInfoScreen extends StatefulWidget {
  const ClientInfoScreen({super.key});

  @override
  State<ClientInfoScreen> createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: TitleTopBar(
          name: 'client info',
          ontap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14.0),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.width * 0.54,
              decoration: BoxDecoration(
                color: cardcolor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(255, 213, 204, 204),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 27),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/head.svg',
                          height: 65,
                          width: 65,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ali raza',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: colortext),
                              ),
                              Text(
                                'dfsdfsdf',
                                style: TextStyle(color: Colors.grey),
                              )
                            ]),
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/message.svg'),
                        Text('  HUDAT8@gmail.com',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/phone.svg'),
                        Text('  HUDAT8@gmail.com',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/location.svg'),
                        Text('  HUDAT8@gmail.com',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            InfoCard(
              ontap: (){Get.toNamed(AppRoutes.order);},
              price: '233 AED',
              shopname: 'dsfsfsf',
              orderno: '23',
            ),
          ],
        ),
      )),
    );
  }
}
