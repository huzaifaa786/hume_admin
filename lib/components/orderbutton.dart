import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
    this.text,
    this.icon,
    this.color,
    this.textcolor,
    this.bordercolor,
    this.onPressed,
    this.width,
  }) : super(key: key);

  final text;
  final icon;
  final color;
  final textcolor;
  final bordercolor;
  final onPressed;
  final width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            border:
                bordercolor != null ? Border.all(color: bordercolor!) : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon,
              ],
              Text(
                text,
                style: TextStyle(color: textcolor, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
