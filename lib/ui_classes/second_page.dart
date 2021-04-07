import 'package:carousel_ui_assignment/custom_widgets/common_button.dart';
import 'package:carousel_ui_assignment/custom_widgets/common_normal_textview.dart';
import 'package:carousel_ui_assignment/custom_widgets/common_title_textview.dart';
import 'package:carousel_ui_assignment/custom_widgets/error_widget.dart';
import 'package:carousel_ui_assignment/custom_widgets/loading_indicator.dart';
import 'package:carousel_ui_assignment/services/models/app_state_enum.dart';
import 'package:carousel_ui_assignment/utility_classes/colors.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:carousel_ui_assignment/view_models/second_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  static const String route  = "/second_page";
  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }

}

class SecondPageState extends State<SecondPage> {

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
      child: ChangeNotifierProvider<SecondPageViewModel> (
        create: (context) => SecondPageViewModel(context),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child:Consumer<SecondPageViewModel>(
            builder: (context,snapshot,child) {
              return getPageState(context,snapshot);
            },
          ),
        ),
      ),
    );
  }
  /// to get state of page so we can show loading and error message accordingly
  Widget getPageState(BuildContext context, SecondPageViewModel snapshot,) {
    switch (snapshot.state) {
      case AppState.loading:
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(child: LoadingIndicator()));
        break;
      case AppState.success:
        return pageUi(context,snapshot);
        break;
      case AppState.failed:
        return ErrorClass(
          errorString: snapshot.errMessage,
          isShowRetry: true,
          retry: (){
            snapshot.fetchAllData();
          },
        );
        break;
      default: return Container();
    }
  }

  Widget pageUi(BuildContext context, SecondPageViewModel snapshot) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: Constant.sizeLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTitleTextView(
              snapshot.model.title ?? "",
              padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            ),
            SizedBox(
              height: Constant.sizeLarge,
            ),
            CommonNormalTextView(
              snapshot.model.description,
              padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            ),
            SizedBox(
              height: Constant.sizeLarge,
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context,index) {
                  return SizedBox(
                    height: Constant.sizeLarge,
                  );
                },
                itemCount: snapshot.model.points.length,
                itemBuilder: (context,index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: new NetworkImage(snapshot.model.points[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Constant.sizeLarge),
                        child: ListView.separated(
                          itemCount: snapshot.model.points[index].subpoints.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context,index) {
                            return SizedBox(
                              height: Constant.sizeSmall,
                            );
                          },
                          itemBuilder: (context,i){
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonNormalTextView((i+ 1).toString()+"."),
                                Expanded(child: CommonNormalTextView(snapshot.model.points[index].subpoints[i], padding: EdgeInsets.only(left: Constant.sizeSmall, right: Constant.sizeLarge)))
                              ],
                            );
                          },
                        ),

                      )
                    ],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );

  }
}
