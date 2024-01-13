// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hume_admin/utils/translation.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      this.controller,
      this.hint,
      this.keyboardType,
      this.text,
      this.width,
      this.color = Colors.white,
      this.obscure = false,
      this.maxlines = false,
      this.enabled = true,
      this.readOnly = false,
      this.onChange,
      this.imageIcon,
      this.validator,
      this.autovalidateMode,
      // this.validate,
      this.icon,
      this.type = TextInputType.text,
      this.fontSize = 14.0,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  final width;
  final obscure;
  final keyboardType;
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
  final fontSize;
  final enabled;
  final readOnly;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
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

    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        width: widget.width,
        child: TextFormField(
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          controller: widget.controller,
          style: TextStyle(fontSize: widget.fontSize),
          obscureText: widget.obscure,
          keyboardType: widget.type,
          validator: widget.validator,
          decoration: InputDecoration(
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
      ),
    );
  }
}
