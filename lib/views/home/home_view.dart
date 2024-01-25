// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/components/home_sizebox.dart';
import 'package:hume_admin/components/hometopbar.dart';
import 'package:hume_admin/components/icon_button.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/app_translate/translate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // Background Image at the bottom

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Hometopbar(
                      ontap: () {
                        Get.toNamed(AppRoutes.notification);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Directionality(
                      textDirection: box.read('locale') == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Row(
                        children: [
                          Text(
                            'Controlling'.tr,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconsButton(
                          height: 50.0,
                          imgicon: SvgPicture.asset('assets/images/add.svg'),
                          title: 'Add product'.tr,
                          color: hintcolor,
                          fontSize: 12.0,
                          onPressed: () {
                            Get.toNamed(AppRoutes.addproduct);
                          },
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        IconsButton(
                          imgicon: SvgPicture.asset('assets/images/add.svg'),
                          title: 'Add Home banner'.tr,
                          fontSize: 12.0,
                          height: 50.0,
                          color: hintcolor,
                          onPressed: () {
                            Get.toNamed(AppRoutes.addbanner);
                          },
                          width: MediaQuery.of(context).size.width * 0.5,
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    IconsButton(
                      imgicon: Icon(Icons.language_outlined),
                      title: 'Language'.tr,
                      fontSize: 12.0,
                      height: 50.0,
                      color: hintcolor,
                      onPressed: () {
                        Get.to(() => TranslateScreen());
                      },
                      width: MediaQuery.of(context).size.width,
                    ),
                    Homecontainer(
                      icon: SvgPicture.asset(
                        'assets/images/sales.svg',
                        height: 40,
                        width: 50,
                      ),
                      text: 'Sales'.tr,
                      onPressed: () {
                        Get.toNamed(AppRoutes.sale);
                      },
                    ),
                    Homecontainer(
                      onPressed: () {
                        Get.toNamed(AppRoutes.shop);
                      },
                      icon: SvgPicture.asset(
                        'assets/images/shope.svg',
                        height: 40,
                        width: 50,
                      ),
                      text: 'Manage Shops'.tr,
                    ),
                    Homecontainer(
                      icon: SvgPicture.asset(
                        'assets/images/order.svg',
                        height: 40,
                        width: 50,
                      ),
                      text: 'Manage Orders'.tr,
                      onPressed: () {
                        Get.toNamed(AppRoutes.manageorder);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SvgPicture.asset(
          'assets/images/backgound.svg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
