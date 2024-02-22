// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/product/product_controller.dart';

class ShoseSizeContainer extends StatefulWidget {
  const ShoseSizeContainer({Key? key, this.text, this.shosesizeValue})
      : super(key: key);

  final String? text;
  final String? shosesizeValue;

  @override
  _ShoseSizeContainerState createState() => _ShoseSizeContainerState();
}

class _ShoseSizeContainerState extends State<ShoseSizeContainer> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });

        if (widget.shosesizeValue != null) {
          ProductController.instance.toggleshoseSize(widget.shosesizeValue!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPressed ? colortext : hintcolor,
          ),
          child: Center(
            child: Text(
              widget.text ?? '',
              style: TextStyle(
                color: isPressed ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// Example usage

