// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hume_admin/utils/colors.dart';

class IconsButton extends StatelessWidget {
  const IconsButton(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.textcolor,
      this.color,
      this.fontSize,
      this.width,
      this.height,
      this.imgicon,
      this.iconTrue = true,
      this.screenRatio = 0.9,
      this.rounded = false,
      })
      : super(key: key);

  final title;
  final fontSize;
  final imgicon;
  final height;
  final iconTrue;
  final onPressed;
  final width;
  final screenRatio;

  final textcolor;
  final color;
  final rounded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary:color,
          shape: RoundedRectangleBorder(
            borderRadius: rounded == true
                ? BorderRadius.all(Radius.circular(45))
                : BorderRadius.all(Radius.circular(30)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: imgicon),
            Text(
              title,
              style: TextStyle(
                color: textcolor,
                fontFamily: 'Poppins',
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
