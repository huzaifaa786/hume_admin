// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/addbanner_box.dart';
import 'package:hume_admin/components/largebutton.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/addbaner/addbanner_controller.dart';

class AddBanner extends StatefulWidget {
  const AddBanner({super.key});

  @override
  State<AddBanner> createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBannerController>(
      initState: (state) async {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.fetchBannerImages();
        });
      },
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'New home banner',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                if (controller.bannerImages == null)
                  AddBannerBox(
                    onPressed: controller.selectBannerImages1,
                    text: 'Choose Page Banner',
                    buttonheight: 48.0,
                    fontSize: 20.0,
                    buttonwidth: MediaQuery.of(context).size.width * 0.42,
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: MediaQuery.of(context).size.height * 0.18,
                  )
                else
                  controller.bannerImage1 != null
                      ? Container(
                          margin: const EdgeInsets.only(top: 14.0,left: 12,right: 12),
                          padding: const EdgeInsets.all(14.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: hintcolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Column(
                                children: [
                                  Image.file(
                                    controller.bannerImage1!,
                                    height: MediaQuery.of(context).size.height *
                                        0.165,
                                    width: 80,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: controller.selectBannerImages1,
                                      child: SvgPicture.asset(
                                          'assets/images/edit.svg')),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 14.0,left: 12,right: 12),
                          padding: const EdgeInsets.all(14.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: hintcolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Column(
                                children: [
                                  Image.network(
                                    controller.bannerImages!.imageUrl1!,
                                    height: Get.height * 0.165,
                                    width: 80,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: controller.selectBannerImages1,
                                      child: SvgPicture.asset(
                                          'assets/images/edit.svg')),
                                ],
                              ),
                            ],
                          ),
                        ),
                if (controller.bannerImages == null)
                  AddBannerBox(
                    onPressed: controller.selectBannerImages2,
                    text: 'Choose Page Banner',
                    buttonheight: 48.0,
                    fontSize: 20.0,
                    buttonwidth: MediaQuery.of(context).size.width * 0.42,
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: MediaQuery.of(context).size.height * 0.18,
                  )
                else
                  controller.bannerImage2 != null
                      ? Container(
                          margin: const EdgeInsets.only(top: 14.0,left: 12,right: 12),
                          padding: const EdgeInsets.all(14.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: hintcolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Column(
                                children: [
                                  Image.file(
                                    controller.bannerImage2!,
                                    height: MediaQuery.of(context).size.height *
                                        0.165,
                                    width: 80,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: controller.selectBannerImages2,
                                      child: SvgPicture.asset(
                                          'assets/images/edit.svg')),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 14.0,left: 12,right: 12),
                          padding: const EdgeInsets.all(14.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: hintcolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Column(
                                children: [
                                  Image.network(
                                    controller.bannerImages!.imageUrl2!,
                                    height: Get.height * 0.165,
                                    width: 80,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: controller.selectBannerImages2,
                                      child: SvgPicture.asset(
                                          'assets/images/edit.svg')),
                                ],
                              ),
                            ],
                          ),
                        ),
                if (controller.bannerImages == null)
                  AddBannerBox(
                    onPressed: controller.selectBannerImages3,
                    text: 'Choose Page Banner',
                    buttonheight: 48.0,
                    fontSize: 20.0,
                    buttonwidth: MediaQuery.of(context).size.width * 0.42,
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: MediaQuery.of(context).size.height * 0.18,
                  )
                else
                  controller.bannerImage3 != null
                      ? Container(
                          margin: const EdgeInsets.only(top: 14.0,left: 12,right: 12),
                          padding: const EdgeInsets.all(14.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: hintcolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Column(
                                children: [
                                  Image.file(
                                    controller.bannerImage3!,
                                    height: MediaQuery.of(context).size.height *
                                        0.165,
                                    width: 80,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: controller.selectBannerImages3,
                                      child: SvgPicture.asset(
                                          'assets/images/edit.svg')),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 14.0,left: 12,right: 12),
                          padding: const EdgeInsets.all(14.0),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: hintcolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Column(
                                children: [
                                  Image.network(
                                    controller.bannerImages!.imageUrl3!,
                                    height: Get.height * 0.165,
                                    width: 80,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: controller.selectBannerImages3,
                                      child: SvgPicture.asset(
                                          'assets/images/edit.svg')),
                                ],
                              ),
                            ],
                          ),
                        ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(14),
          child: LargeButton(
            title: 'Apply',
            onPressed: () {
              controller.bannerImages == null
                  ? controller.storeBanner()
                  : controller.updateBanner();
            },
            textcolor: white,
          ),
        ),
      ),
    );
  }
}
