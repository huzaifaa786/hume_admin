import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';

class CategoryButton extends StatefulWidget {
  const CategoryButton({
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
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          width: widget.width,
          height: 35,
          decoration: BoxDecoration(
            color: isPressed ? colortext : widget.color ?? Colors.white,
            border: widget.bordercolor != null
                ? Border.all(color: widget.bordercolor!)
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
               Row(
                 children: [
                  
                   Text(
                    widget.text,
                    style: TextStyle(
                      color: isPressed ? Colors.white : widget.textcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                                 ),
                 ],
               ),
            ],
          ),
        ),
      ),
    );
  }
}
