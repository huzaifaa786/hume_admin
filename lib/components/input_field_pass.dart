// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/utils/translation.dart';

class PasswordInputField extends StatefulWidget {
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
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  String? hinttext;
  hintTrans() async {
    hinttext = await translateText(widget.hint);
    setState(() {});
  }

  @override
  void initState() {
    hintTrans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      width: Get.width,
      child: TextFormField(
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        controller: widget.controller,
        style: TextStyle(fontSize: widget.fontSize),
        obscureText: widget.obscure,
        keyboardType: widget.type,
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            padding: const EdgeInsets.only(right: 20),
            icon: Icon(
              // Based on passwordVisible state choose the icon
              widget.obscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: maincolor,
            ),
            onPressed: () {
              widget.toggle();
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
          hintText: hinttext ?? '...',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
        ),
        cursorColor: Colors.black,
        maxLines: widget.maxlines == true ? null : 1,
      ),
    );
  }
}
