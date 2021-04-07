import 'package:carousel_ui_assignment/custom_widgets/common_title_textview.dart';
import 'package:flutter/material.dart';

import 'flat_button.dart';

class ErrorClass extends StatelessWidget {
  final VoidCallback retry;
  final String errorString;
  final String retryString;
  final retryButtonStyle;
  final bool isShowRetry;
  final IconData icon;
  ErrorClass({this.retry, this.errorString = 'Data not found',this.retryString,this.retryButtonStyle,this.isShowRetry,this.icon});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CommonTitleTextView(
                errorString,
              ),
              (this.isShowRetry != null && this.isShowRetry) ? FlatButton_(
                title: retryString != null ? retryString : 'Retry',
                icon: icon,
                onClick: (){
                  retry();
                },
              ) : Container()
            ],
          ),
        ),
      ),
    ],
  );
}
