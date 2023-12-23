import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';

class SizeContainer extends StatefulWidget {
  const SizeContainer({Key? key, this.text, this.ontap}) : super(key: key);

  final text;
  final ontap;

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
        if (widget.ontap != null) {
          widget.ontap();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: isPressed ? Colors.white : Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPressed ? maincolor : hintcolor,
          ),
        ),
      ),
    );
  }
}
