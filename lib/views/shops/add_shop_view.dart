import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/addbanner_box.dart';
import 'package:hume_admin/components/button.dart';
import 'package:hume_admin/components/imagecard.dart';
import 'package:hume_admin/components/input_field.dart';

import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/views/shops/shops_controller.dart';

class AddShop extends StatefulWidget {
  const AddShop({super.key});

  @override
  State<AddShop> createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Add Shops',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                width: MediaQuery.of(context).size.width * 0.65,
                hint: 'Shop Name',
              ),
              InputField(
                width: MediaQuery.of(context).size.width * 0.9,
                hint: 'short Discription',
              ),
              Row(
                children: [
                  Column(
                    children: [
                      AddBannerBox(
                        onPressed: () {
                          controller.selectImage();
                        },
                        text: 'Choose Page Panner',
                        buttonheight: 32.0,
                        fontSize: 12,
                        buttonwidth: MediaQuery.of(context).size.width * 0.39,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      ImageBox(
                        image: 'assets/images/banner.svg',
                        name: 'erertrt',
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    children: [
                      AddBannerBox(
                        onPressed: () {
                          controller.selectImage();
                        },
                        text: 'Choose Page Panner',
                        fontSize: 12,
                        buttonheight: 32.0,
                        buttonwidth: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      ImageBox(
                        image: 'assets/images/banner.svg',
                        name: 'erertrt',
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Buttonn(title: 'Add shop', onPressed: () {}),
        ),
      ),
    );
  }
}
