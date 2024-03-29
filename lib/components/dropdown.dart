import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/utils/colors.dart';

class DropDown extends StatelessWidget {
  const DropDown({super.key, this.name, this.ontap});
  final name;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          width: MediaQuery.of(context).size.width * 0.6,
          height: 50,
          decoration: BoxDecoration(
            color: hintcolor,
            borderRadius: BorderRadius.circular(27),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose the store'.tr,
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.keyboard_arrow_down_sharp)
            ],
          ),
        ),
      ),
    );
  }
}
