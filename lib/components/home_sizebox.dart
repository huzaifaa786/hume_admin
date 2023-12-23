import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
              ),
              color: hintcolor),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: maincolor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
