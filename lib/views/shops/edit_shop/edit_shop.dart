// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/components/button.dart';
import 'package:hume_admin/components/categorybutto.dart';
import 'package:hume_admin/components/editimagecard.dart';
import 'package:hume_admin/components/imagecard.dart';
import 'package:hume_admin/components/input_field.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/utils/ui_utils.dart';
import 'package:hume_admin/views/shops/edit_shop/edit_shop_controller.dart';

class EditShop extends StatefulWidget {
  const EditShop({super.key});

  @override
  State<EditShop> createState() => _EditShopState();
}

class _EditShopState extends State<EditShop> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditShopController>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            title: TitleTopBar(
              name: 'Edit Shop'.tr,
              ontap: () {
                Get.back();
              },
            ),
          ),
          body: controller.shopDetails != null
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SafeArea(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputField(
                          width: MediaQuery.of(context).size.width * 0.65,
                          hint: 'name'.tr,
                          controller: controller.name,
                        ),
                        InputField(
                          width: MediaQuery.of(context).size.width * 0.9,
                          hint: 'short Description'.tr,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                      )
                                    : EditImageBox(
                                        ontap: () {
                                          controller.selectImage();
                                        },
                                        image: controller.bannerUrl,
                                        name: controller.bannerImageName,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                      )
                              ],
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              children: [
                                controller.logoImage != null
                                    ? ImageBox(
                                        ontap: () {
                                          controller.selectLogo();
                                        },
                                        image: controller.logoImage,
                                        name: controller.logoImageName,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                      )
                                    : EditImageBox(
                                        ontap: () {
                                          controller.selectLogo();
                                        },
                                        image: controller.logoUrl,
                                        name: controller.logoImageName,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                      )
                              ],
                            )
                          ],
                        ),
                        Gap(20),
                        Text(
                          'Choose Shop Category'.tr,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Gap(20),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                )
              : Container(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Buttonn(
                selected: (controller.arefieldsFilled.value &&
                        controller.selectedIndex != -1)
                    ? true
                    : false,
                title: 'Update shop'.tr,
                onPressed: () {
                  if (controller.arefieldsFilled.value &&
                      controller.selectedIndex != -1) {
                    controller.updateShop();
                  } else {
                    UiUtilites.errorSnackbar(
                        'Fill all fields', 'Please fill all the fields');
                  }
                }),
          ),
        ),
      ),
    );
  }
}
