import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.text, this.fontSize, this.fontWeight, this.colors, this.tOverflow, this.tDecoration, this.maxline, this.textAlign});
  final String text;
  final double ? fontSize;
  final FontWeight ? fontWeight;
  final Color ? colors;
  final TextOverflow ? tOverflow;
  final TextDecoration ? tDecoration;
  final int ? maxline;
  final TextAlign ? textAlign;
  @override
  Widget build(BuildContext context) {
    return  Text(
    textAlign: textAlign,
      maxLines: maxline ?? 1,
      text,style: TextStyle(

      fontSize: fontSize ?? 14,
      fontWeight: fontWeight,
      color: colors ?? Colors.black,
      overflow: tOverflow,
      decoration: tDecoration,
    ),
    );
  }
}