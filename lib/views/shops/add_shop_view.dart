// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/addbanner_box.dart';
import 'package:hume_admin/components/button.dart';
import 'package:hume_admin/components/categorybutto.dart';
import 'package:hume_admin/components/imagecard.dart';
import 'package:hume_admin/components/input_field.dart';

import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/utils/ui_utils.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  width: MediaQuery.of(context).size.width * 0.65,
                  hint: 'Shop Name',
                  controller: controller.name,
                ),
                InputField(
                  width: MediaQuery.of(context).size.width * 0.9,
                  hint: 'short Discription',
                  controller: controller.description,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        controller.isBannerSelected
                            ? ImageBox(
                                ontap: () {
                                  controller.selectImage();
                                },
                                image: controller.bannerImage,
                                name: controller.bannerImageName,
                                width: MediaQuery.of(context).size.width * 0.5,
                              )
                            : AddBannerBox(
                                onPressed: () {
                                  controller.selectImage();
                                },
                                text: 'Choose Page Banner',
                                buttonheight: 32.0,
                                fontSize: 12,
                                buttonwidth:
                                    MediaQuery.of(context).size.width * 0.39,
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                              ),
                      ],
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Column(
                      children: [
                        controller.isLogoSelected
                            ? ImageBox(
                                ontap: () {
                                  controller.selectLogo();
                                },
                                image: controller.logoImage,
                                name: controller.logoImageName,
                                width: MediaQuery.of(context).size.width * 0.4,
                              )
                            : AddBannerBox(
                                onPressed: () {
                                  controller.selectLogo();
                                },
                                text: 'Choose shop logo',
                                fontSize: 12,
                                buttonheight: 32.0,
                                buttonwidth:
                                    MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                              ),
                      ],
                    )
                  ],
                ),
                Gap(20),
                Text(
                  'Choose shop category',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Gap(20),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 50),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryButton(
                      text: controller.categories[index],
                      onPressed: () {
                        setState(() {
                          controller.selectedIndex = index;
                        });
                      },
                      isSelected: index == controller.selectedIndex,
                    );
                  },
                ),
              ],
            )),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Buttonn(
              selected: (controller.arefieldsFilled.value &&
                      controller.isLogoSelected & controller.isBannerSelected &&
                      controller.selectedIndex != -1)
                  ? true
                  : false,
              title: 'Add shop',
              onPressed: () {
                if (controller.arefieldsFilled.value &&
                    controller.isLogoSelected &&
                    controller.isBannerSelected &&
                    controller.selectedIndex != -1) {
                  controller.createShop();
                } else {
                  UiUtilites.errorSnackbar(
                      'Fill all fields', 'Please fill all the fields');
                }
              }),
        ),
      ),
    );
  }
}
