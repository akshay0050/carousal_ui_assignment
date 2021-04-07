import 'package:carousel_ui_assignment/custom_widgets/common_title_textview.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:flutter/material.dart';

class FlatButton_ extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final textStyle;
  final IconData icon;

  FlatButton_({
    @required this.title,
    this.textStyle,
    this.onClick,
    this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () => onClick(),
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(Constant.sizeSmall)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon != null ? icon :Icons.refresh,
              color: Colors.white,
            ),
            CommonTitleTextView(
              title,
            )
          ],
        ),
      ),
    );
  }
}