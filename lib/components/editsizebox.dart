// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hume_admin/utils/colors.dart';

class EditSizeContainer extends StatefulWidget {
  const EditSizeContainer(
      {Key? key,
      this.text,
      this.sizeValue,
      this.isSelected = false,
      this.ontap})
      : super(key: key);

  final String? text;
  final String? sizeValue;
  final bool isSelected;
  final ontap;

  @override
  _EditSizeContainerState createState() => _EditSizeContainerState();
}

class _EditSizeContainerState extends State<EditSizeContainer> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              widget.text ?? '',
              style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isSelected ? colortext : hintcolor,
          ),
        ),
      ),
    );
  }
}




// Example usage

