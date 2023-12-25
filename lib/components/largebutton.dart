// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';


class LargeButton extends StatelessWidget {
  const LargeButton(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.textcolor,
      this.icon,
      this.buttonWidth = 0.6,
      this.screenRatio = 0.9,
      this.rounded = false,
      this.color = maincolor})
      : super(key: key);

  final title;
  final onPressed;
  final screenRatio;
  final color;
  final textcolor;
  final icon;
  final rounded;
  final buttonWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
        width: MediaQuery.of(context).size.width * buttonWidth,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textcolor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
