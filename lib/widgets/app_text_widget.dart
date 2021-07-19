import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final TextAlign textAlign;

  AppTextWidget(
    this.text, {
    this.color = Colors.black,
    this.fontFamily = 'montserrat',
    this.fontWeight = FontWeight.normal,
    this.fontSize = 15,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}
