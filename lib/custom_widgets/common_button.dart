import 'package:carousel_ui_assignment/custom_widgets/common_normal_textview.dart';
import 'package:carousel_ui_assignment/utility_classes/colors.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color borderColor;
  final String title;
  final Function() onClick;
  final bool showIcon;
  const CommonButton({Key key, this.borderColor, this.title, this.onClick, this.showIcon = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      this.onClick();
      },
      child: Container(
        padding: EdgeInsets.all(Constant.sizeLarge),
        decoration: BoxDecoration(
          border: Border.all(
            width: Constant.size1,
            color: borderColor ?? CommonColors.white.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: CommonNormalTextView(
                  this.title,
                  textAlign: showIcon ? TextAlign.left : TextAlign.center,
                )
            ),
            showIcon ? Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_sharp,
                color: CommonColors.white,
              ),
            ) : Container()
          ],
        ),
      ),
    );
  }

}