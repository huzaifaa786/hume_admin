// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GuestTopbar extends StatelessWidget {
  const GuestTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          SvgPicture.asset('assets/images/dots.svg')
        ]),
    );
  }
}