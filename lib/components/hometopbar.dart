import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/utils/fontWeight.dart';

class Hometopbar extends StatelessWidget {
 const Hometopbar({super.key, this.name, this.ontap});
  final name;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/images/head.svg'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ali Raza',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text('Admin'),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: ontap,
          child: Row(
            children: [Icon(Icons.notifications)],
          ),
        )
      ],
    );
  }
}