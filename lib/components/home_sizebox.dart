// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/utils/colors.dart';

class Homecontainer extends StatelessWidget {
  const Homecontainer({
    Key? key,
    this.icon,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final icon;
  final text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Directionality(
      textDirection:
          box.read('locale') == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.9,
            height: 75,
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                ),
                color: hintcolor),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: maincolor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
