// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/icon_button.dart';
import 'package:hume_admin/utils/colors.dart';

class ShopCard extends StatelessWidget {
  const ShopCard(
      {super.key,
      this.name,
      this.ontap,
      this.category,
      this.onPressed,
      this.image,
      this.updateShop});
  final name;
  final ontap;
  final category;
  final onPressed;
  final image;
  final updateShop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
            padding: const EdgeInsets.all(7),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 79,
            decoration: BoxDecoration(
              color: hintcolor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(image),
                      ),
                    ),
                    // Image.network(
                    //   image,
                    //   height: 50,
                    //   width: 50,
                    // ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(maxWidth: Get.width * 0.28),
                                child: Text(
                                  name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: maincolor),
                                ),
                              ),
                              SvgPicture.asset('assets/images/tick.svg')
                            ],
                          ),
                          Text(
                            '$category',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:
                                    const Color.fromARGB(255, 187, 173, 173)),
                          ),
                        ]),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: updateShop,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: maincolor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.edit_document,
                            color: maincolor,
                          )),
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: onPressed,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                    Gap(10),
                  ],
                )

                // IconsButton(
                //   color: white,
                //   height: 40.0,
                //   // width: MediaQuery.of(context).size.width * 0.35,
                //   title: 'Delete Shop',
                //   fontSize: 14.0,
                //   textcolor: Colors.red,
                //   onPressed: onPressed,
                // )
              ],
            )),
      ),
    );
  }
}
