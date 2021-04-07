import 'package:carousel_ui_assignment/utility_classes/colors.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:carousel_ui_assignment/utility_classes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CommonTitleTextView extends StatelessWidget {
  CommonTitleTextView(
    this.text, {
    this.color,
    this.textAlign,
    this.fontSize,
    this.padding,
    this.isSingleLine,
  });

  final String text;
  final bool isSingleLine;
  final TextAlign textAlign;
  final double fontSize;
  final Color color ;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return (text != null && text.isNotEmpty)
        ? Padding(
            padding: this.padding ?? EdgeInsets.all(0),
            child: Text(
              text ?? "",
              textAlign: textAlign ?? TextAlign.left,
              maxLines: this.isSingleLine == true ? 1 : null,
              style: TextStyle(
                  color: this.color ?? CommonColors.white,
                  fontFamily: Fonts.fontName,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize ?? FontSize.s18),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          )
        : Container();
  }
}
