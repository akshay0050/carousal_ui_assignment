import 'package:carousel_ui_assignment/utility_classes/colors.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:carousel_ui_assignment/utility_classes/fonts.dart';
import 'package:flutter/material.dart';


class CommonNormalTextView extends StatelessWidget {
  CommonNormalTextView(this.text,
      {this.fontFamily,
      this.color,
      this.textAlign,
      this.fontSize,
      this.textDecoration,
      this.padding});

  final String text;
  final TextAlign textAlign;
  final double fontSize ;
  final Color color ;
  final String fontFamily;
  final TextDecoration textDecoration;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null ? EdgeInsets.all(0.0) : padding,
      child: Text(
        text,
        textAlign: textAlign?? TextAlign.left,
        style: TextStyle(
          decoration: textDecoration,
          color: color ?? CommonColors.white,
          fontFamily: Fonts.fontName,
          fontWeight: FontWeight.normal,
          fontSize: fontSize ?? FontSize.s14,
        ),
        softWrap: true,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
