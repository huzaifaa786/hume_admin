// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';

class EditTitleTopBar extends StatelessWidget {
  const EditTitleTopBar({super.key, this.name, this.ontap, this.onPressed});
  final name;
  final ontap;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: ontap,
              child: Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: maincolor),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: onPressed,
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
