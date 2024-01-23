// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/utils/colors.dart';

class Buttonn extends StatelessWidget {
  const Buttonn({
    Key? key,
    @required this.title,
    @required this.onPressed,
    this.isValid = false,
    this.selected = false, // Default value is false
  }) : super(key: key);

  final title;
  final onPressed;
  final bool selected;
  final bool isValid;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: selected ? maincolor : Colors.grey.shade400, // Solid color instead of gradient
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/home.svg',color: white,),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
