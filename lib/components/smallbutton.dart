// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/utils/colors.dart';


class Button extends StatelessWidget {
  const Button(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.textcolor,
      this.icon,
      this.fontSize,
      this.buttonheight,
      this.buttonWidth,
      this.screenRatio = 0.9,
      this.rounded = false,
      this.color = maincolor})
      : super(key: key);

  final title;
  final fontSize;
  final onPressed;
  final screenRatio;
  final color;
  final textcolor;
  final buttonheight;
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
        width: buttonWidth,
        height: buttonheight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textcolor,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
