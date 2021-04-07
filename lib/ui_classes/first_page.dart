import 'package:carousel_ui_assignment/custom_widgets/common_button.dart';
import 'package:carousel_ui_assignment/custom_widgets/common_normal_textview.dart';
import 'package:carousel_ui_assignment/custom_widgets/common_title_textview.dart';
import 'package:carousel_ui_assignment/custom_widgets/error_widget.dart';
import 'package:carousel_ui_assignment/custom_widgets/loading_indicator.dart';
import 'package:carousel_ui_assignment/services/models/app_state_enum.dart';
import 'package:carousel_ui_assignment/ui_classes/second_page.dart';
import 'package:carousel_ui_assignment/ui_classes/third_page.dart';
import 'package:carousel_ui_assignment/utility_classes/colors.dart';
import 'package:carousel_ui_assignment/utility_classes/dimen.dart';
import 'package:carousel_ui_assignment/view_models/first_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  static const String route  = "/first_page";
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }

}

class FirstPageState extends State<FirstPage> {
  final _pageController = PageController(viewportFraction: 0.9);
  int currentPage = 0;
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
      child: ChangeNotifierProvider<FirstPageViewModel> (
        create: (context) => FirstPageViewModel(context),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child:Consumer<FirstPageViewModel>(
            builder: (context,snapshot,child) {
              return getPageState(context,snapshot);
            },
          ),
        ),
      ),
    );
  }
  /// to get state of page so we can show loading and error message accordingly
  Widget getPageState(BuildContext context, FirstPageViewModel snapshot,) {
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

  Widget pageUi(BuildContext context, FirstPageViewModel snapshot) {
    return SingleChildScrollView(
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonNormalTextView(
                        snapshot.model.subtitle1 ?? "",
                        color: CommonColors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: Constant.sizeExtraSmall,
                      ),
                      CommonNormalTextView(
                        snapshot.model.subtitle2 ?? "",
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.edit,
                    color: CommonColors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(snapshot.model.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child:CommonTitleTextView(
                    snapshot.model.pageTitle ?? "",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: getIndicatorWidget(snapshot),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.63,
            child: PageView.builder(
              controller: _pageController,
              itemCount: snapshot.model.pages.length,
              onPageChanged: _onPageViewChange,
              itemBuilder: (context, position) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: Constant.size1,
                        color: CommonColors.white.withOpacity(0.5),
                      ),
                    color: CommonColors.white.withOpacity(0.1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonTitleTextView((position + 1).toString(),fontSize: FontSize.s30,padding: EdgeInsets.only(left: Constant.sizeLarge,top: Constant.sizeSmall),),
                      SizedBox(
                        height: Constant.sizeLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Constant.sizeLarge),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: new NetworkImage(snapshot.model.pages[position].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Constant.sizeXL,
                      ),
                      CommonTitleTextView(snapshot.model.pages[position].title ?? "",fontSize: FontSize.s18,padding: EdgeInsets.only(left: Constant.sizeLarge),),
                      SizedBox(
                        height: Constant.sizeLarge,
                      ),
                      CommonNormalTextView(snapshot.model.pages[position].description ?? "",padding: EdgeInsets.only(left: Constant.sizeLarge),),
                      SizedBox(
                        height: Constant.sizeXL,
                      ),
                      CommonNormalTextView(snapshot.model.pages[position].subtitle ?? "",padding: EdgeInsets.only(left: Constant.sizeLarge),color: CommonColors.blue,),

                    ],
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: Constant.sizeXXL,
          ),
          CommonTitleTextView("Sollicitudin in tortor.", fontSize: FontSize.s18,padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          CommonNormalTextView(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Platea sollicitudin platea habitant senectus. Placerat.",
              padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge)
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constant.sizeLarge),
            child:
            CommonButton(
              title: "Egestas scleri",
              onClick: () {
                Navigator.pushNamed(context, SecondPage.route);
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
              title: "Consectur",
              onClick: () {
                Navigator.pushNamed(context, ThirdPage.route);
              },
            ),
          ),
          SizedBox(
            height: Constant.sizeLarge,
          ),
        ],
      ),
    );

  }

  /// to indicate active indicator while swiping page
  List<Widget> getIndicatorWidget(FirstPageViewModel snapshot) {
    return List.generate(snapshot.model.pages.length, (index) => Container(
      height: Constant.sizeSmall,
      width: Constant.sizeSmall,
      margin: EdgeInsets.only(left: Constant.size3),
      decoration: BoxDecoration(
        color: this.currentPage == index ? CommonColors.blue: Colors.transparent,
        shape: BoxShape.circle,
        border: new Border.all(
          width: Constant.size1,
          color: CommonColors.white.withOpacity(0.5),
        ),
      ),
    ));
  }

  /// to get the current page number
  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
   setState(() {
     currentPage = page;
   });
  }
}
