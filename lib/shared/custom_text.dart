import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.weight,
    this.color,
  });
  final String text;
  final double? fontSize;
  final FontWeight? weight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      textScaler: TextScaler.noScaling,
      // overflow: TextOverflow.ellipsis,
      text,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: weight),
    );
  }
}
