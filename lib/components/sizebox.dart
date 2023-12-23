import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';

class SizeContainer extends StatelessWidget {
  const SizeContainer({super.key, this.text, this.ontap});
  final text;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 50,
          height: 50,
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.black),
          )),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hintcolor,
          ),
        ),
      ),
    );
  }
}
