import 'package:carousel_ui_assignment/custom_widgets/common_button.dart';
import 'package:carousel_ui_assignment/custom_widgets/common_normal_textview.dart';
import 'package:carousel_ui_assignment/custom_widgets/common_title_textview.dart';
import 'package:carousel_ui_assignment/custom_widgets/error_widget.dart';
import 'package:carousel_ui_assignment/custom_widgets/loading_indicator.dart';
import 'package:carousel_ui_assignment/services/models/app_state_enum.dart';
import 'package:carousel_ui_assignment/utility_classes/colors.dart';
import 'package:carousel_ui_assignment/utility_classes/common_message.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:carousel_ui_assignment/view_models/third_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends StatefulWidget {
  static const String route  = "/third_page";
  @override
  State<StatefulWidget> createState() {
    return ThirdPageState();
  }

}

class ThirdPageState extends State<ThirdPage> {
  List<String> firstList;
  List<String> secondList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          top: true,
          bottom: true,
          child: getMainUi(context)
      ),
    );
  }
  ///provider is implemented in this function with the help of consumer we can get data from View Model class
  Widget getMainUi(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvider<ThirdPageViewModel> (
        create: (context) => ThirdPageViewModel(context),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child:Consumer<ThirdPageViewModel>(
            builder: (context,snapshot,child) {
              return getPageState(context,snapshot);
            },
          ),
        ),
      ),
    );
  }

  Widget pageUi(BuildContext context, ThirdPageViewModel snapshot) {
    return Container(
      padding: EdgeInsets.only(top: Constant.sizeLarge),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTitleTextView(
            "Fringilla vulputate.",
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          CommonNormalTextView(
            "Massa risus.",
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context,index){
                return SizedBox(
                  height: Constant.sizeSmall,
                );
              },
              itemCount: snapshot.dataList.take(5).length, // to show demo purpose taken only 5 value
              itemBuilder: (context,index) {
                return InkWell(
                  onTap: () {
                    try{
                      _launchURL(snapshot.dataList[index].url);
                    }on Exception catch(_) {
                      _showToast(CommonMessage.urlOpenError);
                    }
                    catch(_) {
                      _showToast(CommonMessage.urlOpenError);
                    }
                  },
                  child: Container(
                    color: CommonColors.white.withOpacity(0.1),
                    padding: EdgeInsets.all(Constant.sizeSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: CommonTitleTextView(snapshot.dataList[index].title)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                              Icons.arrow_forward_sharp,
                              color: CommonColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            child:
            CommonButton(
              title: "Lorem Ipsum",
              showIcon: false,
              borderColor: CommonColors.blue,
              onClick: () {},
            ),
          ),

        ],
      ),
    );
  }

  /// to get state of page so we can show loading and error message accordingly
  Widget getPageState(BuildContext context, ThirdPageViewModel snapshot,) {
    switch (snapshot.state) {
      case AppState.loading:
        return LoadingIndicator();
        break;
      case AppState.success:
        return pageUi(context,snapshot);
        break;
      case AppState.failed:
        return ErrorClass(
          errorString: snapshot.errMessage,
          isShowRetry: true,
          retry: (){
          },
        );
        break;
      default: return Container();
    }
  }

  /// to launch url on mobile browser
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  /// to show error message
  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
