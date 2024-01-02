// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hume_admin/utils/colors.dart';

class EditImageBox extends StatelessWidget {
  const EditImageBox(
      {super.key,
      this.onPressed,
      this.ontap,
      this.image,
      this.width,
      this.text,
      this.height,
      this.fontSize,
      this.name,
      this.buttonwidth,
      this.buttonheight});
  final onPressed;
  final text;
  final ontap;
  final fontSize;
  final image;
  final name;
  final width;
  final height;
  final buttonwidth;
  final buttonheight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: hintcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(''),
            Column(
              children: [
                Image.network(
                  image,
                  width: 29,
                  height: 29,
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 119, 110, 110)),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: ontap,
                    child: SvgPicture.asset('assets/images/edit.svg')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
