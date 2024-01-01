import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/addbanner_box.dart';
import 'package:hume_admin/components/largebutton.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/utils/controller_initlization.dart';
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
                AddBannerBox(
                  onPressed: () {
                    controller.selectProfileImage();
                  },
                  text: 'Choose Page Banner',
                  buttonheight: 48.0,
                  fontSize: 20.0,
                  buttonwidth: MediaQuery.of(context).size.width * 0.42,
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: MediaQuery.of(context).size.height * 0.18,
                                  ),
                SizedBox(
                  height: 13,
                ),
                if (controller.bannerImage != null)
                  Container(
                    padding: const EdgeInsets.all(14.0),
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.width * 0.4,
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
                              controller.bannerImage!,
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              controller.bannerImageName!,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 119, 110, 110),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/edit.svg'),
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
              controller.storeBanner();
            },
            textcolor: white,
          ),
        ),
      ),
    );
  }
}
