import 'package:flutter/material.dart';
import 'package:hume_admin/components/smallbutton.dart';
import 'package:hume_admin/utils/colors.dart';

class AddBannerBox extends StatelessWidget {
  const AddBannerBox({
    Key? key,
    this.onPressed,
    this.ontap,
    this.width,
    this.height,
    this.fontSize,
    this.buttonwidth,
    this.buttonheight,
    this.text, // Make text parameter optional
  }) : super(key: key);

  final onPressed;
  final ontap;
  final text;
  final fontSize;
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (text != null) 
                Text(
                  text,
                  style: TextStyle(color: const Color.fromARGB(255, 119, 110, 110)),
                ),
              SizedBox(
                height: 12,
              ),
              Button(
                buttonWidth: buttonwidth,
                buttonheight: buttonheight,
                title: 'Upload',
                onPressed: onPressed,
                textcolor: white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
