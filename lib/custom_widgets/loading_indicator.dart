import 'package:carousel_ui_assignment/utility_classes/colors.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color backgroundColor;

  const LoadingIndicator({Key key, this.backgroundColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Constant.setScreenAwareConstant(context);
    return Material(
      color: backgroundColor != null ? backgroundColor : CommonColors.black,
      child: Center(
        child: Container(
            width: Constant.sizeXXL,
            height: Constant.sizeXXL,
            child: CircularProgressIndicator(
              backgroundColor: CommonColors.white,
              strokeWidth: Constant.sizeExtraSmall,
              valueColor: new AlwaysStoppedAnimation<Color>(CommonColors.blue),
            )),
      ),
    );
  }
}