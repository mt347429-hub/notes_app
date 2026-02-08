import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, this.maxLine = 1});
  final String text;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      cursorColor: Color(0xff62fcd7),
      decoration: InputDecoration(
        hint: Text(text, style: TextStyle(color: Color(0xff62fcd7))),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(Color(0xff62fcd7)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
