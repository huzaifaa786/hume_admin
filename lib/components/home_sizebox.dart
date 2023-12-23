// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
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
    return InkWell(
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
    );
  }
}
