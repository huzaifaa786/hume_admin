// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/categorybutto.dart';
import 'package:hume_admin/components/editsizebox.dart';
import 'package:hume_admin/components/icon_button.dart';
import 'package:hume_admin/components/input_field.dart';
import 'package:hume_admin/components/shopdropdown.dart';
import 'package:hume_admin/components/sizebox.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/components/validarebutton.dart';
import 'package:hume_admin/utils/ui_utils.dart';
import 'package:hume_admin/views/product/editproduct/editproduct_controller.dart';
import 'package:path/path.dart';
import 'package:hume_admin/utils/colors.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProductController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Edit Product',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InputField(
                      hint: 'product name',
                      controller: controller.ProductnameController,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    InputField(
                      type: TextInputType.number,
                      controller: controller.productpriceController,
                      hint: 'price',
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(14.0),
                  width: MediaQuery.of(context).size.width * 0.93,
                  decoration: BoxDecoration(
                    color: hintcolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconsButton(
                            width: MediaQuery.of(context).size.width * 0.59,
                            imgicon:
                                SvgPicture.asset('assets/images/upload.svg'),
                            fontSize: 14.0,
                            title: 'Upload',
                            height: 50.0,
                            textcolor: white,
                            color: maincolor,
                            onPressed: () {
                              controller.selectImages();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Uploaded images',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          for (var i = 0;
                              i < controller.productImages.length;
                              i++)
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.file(
                                    controller.productImages[i],
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width*0.5,
                                  child: Text(
                                    '${basename(controller.productImages[i].path)}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 1,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.deletefileImage(i);
                                    },
                                    child: Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          for (var i = 0;
                              i < controller.productNetworkImages.length;
                              i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.network(
                                      controller.productNetworkImages[i]
                                          .toString(),
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    )),
                                // Text(
                                //   '${basename(controller.pr[i].path)}',
                                //   style: TextStyle(
                                //       color: Colors.grey, fontSize: 12),
                                // ),
                                InkWell(
                                    onTap: () {
                                      controller.deletenetworkImage(i);
                                    },
                                    child: Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                controller.shops.isNotEmpty
                    ? ShopDropdownField(
                        imageIcon: 'assets/images/tickk.svg',
                        items: controller.shops,
                        selectedValue: controller.selectedShop,
                        icon: Icon(Icons.shop),
                        onChange: (value) {
                          setState(() {
                            controller.selectedShop = value;
                            controller.checkFields();
                          });
                        },
                      )
                    : SizedBox(),
                InputField(
                  controller: controller.productdiscriptionController,
                  hint: 'Discription',
                  width: MediaQuery.of(context).size.width * 0.94,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Sizes (Optional,)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    for (var size in ['S', 'M', 'L', 'XL', '2XL', '3XL'])
                      EditSizeContainer(
                        text: size,
                        isSelected: controller.selectedSizes
                            .where((element) => element == size)
                            .isNotEmpty,
                        sizeValue: size,
                      ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Choose product Catigory',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 16,
                ),
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
                          controller.checkFields();
                        });
                      },
                      isSelected: index == controller.selectedIndex,
                    );
                  },
                ),
              ],
            ),
          )),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(14),
          child: validateButton(
            title: 'Sell Product ',
            onPressed: controller.areFieldsFilled.value
                ? () {
                    controller.updateProduct();
                  }
                : () {
                    UiUtilites.errorSnackbar(
                        'Fill out all fields', 'Please fill all above fields');
                  },
            selected: controller.areFieldsFilled.value,
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    // You can implement your own logic here to determine the cross axis count
    // For example, return 3 for every third row, and 2 for others
    int rowIndex = (MediaQuery.of(context).size.width / 200).floor();
    return rowIndex % 3 == 0 ? 3 : 2;
  }
}