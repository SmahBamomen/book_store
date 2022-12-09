import 'package:flutter/material.dart';
class TextUtils extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const TextUtils({
    required this.text,
    Key? key, required this.fontSize, required this.fontWeight, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color:color,
      ),
    );
  }
}
