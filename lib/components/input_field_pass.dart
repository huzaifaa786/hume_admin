// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/utils/colors.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.color = Colors.white,
      this.obscure = false,
      this.maxlines = false,
      this.enabled = true,
      this.readOnly = false,
      this.onChange,
      this.imageIcon,
      this.toggle,
      this.validator,
      this.autovalidateMode,
      // this.validate,
      this.icon,
      this.type = TextInputType.visiblePassword,
      this.fontSize = 14.0,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  // final RxBool? validate;
  final obscure;
  final hint;
  final type;
  final imageIcon;
  final icon;
  final text;
  final autovalidateMode;
  final color;
  final maxlines;
  final onChange;
  final onpressed;
  final toggle;
  final fontSize;
  final enabled;
  final readOnly;

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      width: Get.width,
      child: TextFormField(
        readOnly: readOnly,
        enabled: enabled,
        controller: controller,
        style: TextStyle(fontSize: fontSize),
        obscureText: obscure,
        keyboardType: type,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            padding: const EdgeInsets.only(right: 20),
            icon: Icon(
              // Based on passwordVisible state choose the icon
              obscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: maincolor,
            ),
            onPressed: () {
              toggle();
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
        ),
        cursorColor: Colors.black,
        maxLines: maxlines == true ? null : 1,
      ),
    );
  }
}
