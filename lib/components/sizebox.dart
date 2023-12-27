import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/product/product_controller.dart';

class SizeContainer extends StatefulWidget {
  const SizeContainer({Key? key, this.text, this.sizeValue}) : super(key: key);

  final String? text;
  final String? sizeValue;

  @override
  _SizeContainerState createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });

        if (widget.sizeValue != null) {
          ProductController.instance.toggleSize(widget.sizeValue!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              widget.text ?? '',
              style: TextStyle(
                color: isPressed ? Colors.white : Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPressed ? colortext : hintcolor,
          ),
        ),
      ),
    );
  }
}




// Example usage

