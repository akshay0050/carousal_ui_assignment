import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Size screenSize;
double defaultScreenWidth = 375.0;
double defaultScreenHeight = 812.0;
double screenWidth = defaultScreenWidth;
double screenHeight = defaultScreenHeight;

class Constant {
  /*Padding & Margin Constants*/
  static double size1 = 1.0;
  static double size2 = 2.0;
  static double size3 = 3.0;
  static double size4 = 4.0;
  static double sizeExtraSmall = 5.0;
  static double sizeDefault = 8.0;
  static double sizeSmall = 10.0;
  static double sizeMedium = 15.0;
  static double sizeLarge = 20.0;
  static double size23 = 23.0;
  static double size25 = 25.0;
  static double size27 = 27.0;
  static double sizeXL = 30.0;
  static double size32 = 32.0;
  static double size35 = 35.0;
  static double size37 = 37.0;
  static double sizeXXL = 40.0;
  static double sizeXXXL = 50.0;
  static double size56 = 56.0;
  static double size57 = 57.0;
  static double size58 = 58.0;
  static double size60 = 60.0;
  static double size70 = 70.0;
  static double size75 = 75.0;
  static double size80 = 80.0;
  static double size98 = 98.0;
  static double size99 = 99.0;
  static double size100 = 100.0;
  static double size102 = 102.0;
  static double size130 = 130.0;
  static double size140 = 140.0;
  static double size150 = 150.0;
  static double size175 = 175.0;
  static double size198 = 198.0;
  static double size199 = 199.0;
  static double size200 = 200.0;
  static double size202 = 202.0;
  static double size250 = 250.0;
  static double size280 = 280.0;
  static double size290 = 290.0;
  static double size300 = 300.0;
  static double size350 = 350.0;
  static double size380 = 380.0;
  static double size400 = 400.0;
  static double size420 = 420.0;
  static double size430 = 430.0;
  static double size440 = 440.0;
  static double size450 = 450.0;
  static double size500 = 500.0;
  static double size600 = 600.0;

  static double size2W = 2.0;
  static double sizeExtraSmallW = 5.0;
  static double sizeDefaultW = 8.0;
  static double sizeSmallW = 10.0;
  static double sizeMediumW = 15.0;
  static double sizeLargeW = 20.0;
  static double size25W = 25.0;
  static double size27W = 27.0;
  static double size23W = 23.0;
  static double sizeXLW = 30.0;
  static double sizeXXLW = 40.0;
  static double sizeXXXLW = 50.0;
  static double size56W = 56.0;
  static double size60W = 60.0;
  static double size70W = 70.0;
  static double size75W = 75.0;
  static double size100W = 100.0;
  static double size140W = 140.0;
  static double size150W = 150.0;
  static double size175W = 175.0;
  static double size200W = 200.0;
  static double size300W = 300.0;
  static double size350W = 350.0;

  /*Screen Size dependent Constants*/
  static double screenWidth = screenWidth;
  static double screenHeight = screenHeight;
  static double screenWidthHalf = screenWidth / 2;
  static double screenWidthThird = screenWidth / 3;
  static double screenWidthFourth = screenWidth / 4;
  static double screenWidthFifth = screenWidth / 5;
  static double screenWidthSixth = screenWidth / 6;
  static double screenWidthTenth = screenWidth / 10;

  static double screenHeightHalf = screenHeight / 2;
  static double screenHeightThird = screenHeight / 3;
  static double screenHeightForth = screenHeight / 4;

  /*Image Dimensions*/

  static double defaultIconSize = 80.0;
  static double defaultImageHeight = 120.0;
  static double snackBarHeight = 50.0;
  static double texIconSize = 30.0;

  /*Default Height&Width*/
  static double defaultIndicatorHeight = 5.0;
  static double defaultIndicatorWidth = screenWidthFourth;

  /*EdgeInsets*/
  static EdgeInsets spacingAllDefault = EdgeInsets.all(sizeDefault);
  static EdgeInsets spacingAllSmall = EdgeInsets.all(sizeSmall);

  static void setDefaultSize(context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;

    sizeLarge = 20.0;
    size25 = 25.0;
    size23 = 23.0;
    size37 = 37.0;
    sizeXL = 30.0;
    sizeXXL = 40.0;
    size32 = 32.0;
    size35 = 35.0;
    sizeXXXL = 50.0;
    size60 = 60.0;
    size70 = 70.0;
    size75 = 75.0;
    size100 = 100.0;
    size130 = 130.0;
    size150 = 150.0;
    size175 = 175.0;
    size200 = 200.0;

    screenWidthHalf = screenWidth / 2;
    screenWidthThird = screenWidth / 3;
    screenWidthFourth = screenWidth / 4;
    screenWidthFifth = screenWidth / 5;
    screenWidthSixth = screenWidth / 6;
    screenWidthTenth = screenWidth / 10;

    screenHeightForth = screenHeight / 4;

    defaultIconSize = 80.0;
    defaultImageHeight = 120.0;
    snackBarHeight = 50.0;
    texIconSize = 30.0;

    defaultIndicatorHeight = 5.0;
    defaultIndicatorWidth = screenWidthFourth;

    spacingAllDefault = EdgeInsets.all(sizeDefault);
    spacingAllSmall = EdgeInsets.all(sizeSmall);

    FontSize.setDefaultFontSize();
  }

  static void setScreenAwareConstant(context) {
    // ignore: missing_return
    ScreenUtil.init(
      context,
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    );

    //if(ScreenUtil.screenWidth < defaultScreenWidth) {
    //FontSize.setScreenAwareFontSize();

    /*Padding & Margin Constants*/
    size1 = ScreenUtil().setHeight(1.0);
    size2 = ScreenUtil().setHeight(2.0);
    size3 = ScreenUtil().setHeight(3.0);
    size4 = ScreenUtil().setHeight(4.0);
    sizeExtraSmall = ScreenUtil().setHeight(5.0);
    sizeDefault = ScreenUtil().setHeight(8.0);
    sizeSmall = ScreenUtil().setHeight(10.0);
    sizeMedium = ScreenUtil().setHeight(15.0);
    sizeLarge = ScreenUtil().setHeight(20.0);
    size25 = ScreenUtil().setHeight(25.0);
    size27 = ScreenUtil().setHeight(27.0);
    size23 = ScreenUtil().setHeight(23.0);
    size37 = ScreenUtil().setHeight(37.0);
    sizeXL = ScreenUtil().setHeight(30.0);
    size32 = ScreenUtil().setHeight(32.0);
    size35 = ScreenUtil().setHeight(35.0);
    sizeXXL = ScreenUtil().setHeight(40.0);
    sizeXXXL = ScreenUtil().setHeight(50.0);
    size56 = ScreenUtil().setHeight(56.0);
    size57 = ScreenUtil().setHeight(57.0);
    size58 = ScreenUtil().setHeight(58.0);
    size60 = ScreenUtil().setHeight(60.0);
    size70 = ScreenUtil().setHeight(70.0);
    size75 = ScreenUtil().setHeight(75.0);
    size80 = ScreenUtil().setHeight(80.0);
    size98 = ScreenUtil().setHeight(98.0);
    size99 = ScreenUtil().setHeight(99.0);
    size100 = ScreenUtil().setHeight(100.0);
    size102 = ScreenUtil().setHeight(102.0);
    size130 = ScreenUtil().setHeight(130.0);
    size140 = ScreenUtil().setHeight(140.0);
    size150 = ScreenUtil().setHeight(150.0);
    size175 = ScreenUtil().setHeight(175.0);
    size198 = ScreenUtil().setHeight(198.0);
    size199 = ScreenUtil().setHeight(199.0);
    size200 = ScreenUtil().setHeight(200.0);
    size202 = ScreenUtil().setHeight(202.0);
    size250 = ScreenUtil().setHeight(250.0);
    size280 = ScreenUtil().setHeight(280.0);
    size290 = ScreenUtil().setHeight(290.0);
    size300 = ScreenUtil().setHeight(300.0);
    size350 = ScreenUtil().setHeight(350.0);
    size400 = ScreenUtil().setHeight(400.0);
    size420 = ScreenUtil().setHeight(420.0);
    size430 = ScreenUtil().setHeight(430.0);
    size440 = ScreenUtil().setHeight(440.0);
    size450 = ScreenUtil().setHeight(450.0);
    size500 = ScreenUtil().setHeight(500.0);
    size600 = ScreenUtil().setHeight(600.0);

    size2W = ScreenUtil().setWidth(2.0);
    sizeExtraSmallW = ScreenUtil().setWidth(5.0);
    sizeDefaultW = ScreenUtil().setWidth(8.0);
    sizeSmallW = ScreenUtil().setWidth(10.0);
    sizeMediumW = ScreenUtil().setWidth(15.0);
    sizeLargeW = ScreenUtil().setWidth(20.0);
    size25W = ScreenUtil().setWidth(25.0);
    size27W = ScreenUtil().setWidth(27.0);
    size23W = ScreenUtil().setWidth(23.0);
    sizeXLW = ScreenUtil().setWidth(30.0);
    sizeXXLW = ScreenUtil().setWidth(40.0);
    sizeXXXLW = ScreenUtil().setWidth(50.0);
    size56W = ScreenUtil().setWidth(56.0);
    size60W = ScreenUtil().setWidth(60.0);
    size70W = ScreenUtil().setWidth(70.0);
    size75W = ScreenUtil().setWidth(75.0);
    size100W = ScreenUtil().setWidth(100.0);
    size140W = ScreenUtil().setWidth(140.0);
    size150W = ScreenUtil().setWidth(150.0);
    size175W = ScreenUtil().setWidth(175.0);
    size200W = ScreenUtil().setWidth(200.0);
    size300W = ScreenUtil().setWidth(300.0);
    size350W = ScreenUtil().setWidth(350.0);
    //}
    /*EdgeInsets*/

    spacingAllDefault = EdgeInsets.all(sizeDefault);
    spacingAllSmall = EdgeInsets.all(sizeSmall);

    /*Screen Size dependent Constants*/
    screenWidthHalf = ScreenUtil.screenWidth / 2;
    screenWidthThird = ScreenUtil.screenWidth / 3;
    screenWidthFourth = ScreenUtil.screenWidth / 4;
    screenWidthFifth = ScreenUtil.screenWidth / 5;
    screenWidthSixth = ScreenUtil.screenWidth / 6;
    screenWidthTenth = ScreenUtil.screenWidth / 10;
    screenHeightForth = ScreenUtil.screenHeight / 4;
    screenHeightThird = ScreenUtil.screenHeight / 3;
    screenHeightHalf = ScreenUtil.screenHeight / 2;

    /*Image Dimensions*/

    defaultIconSize = ScreenUtil().setWidth(80.0);
    defaultImageHeight = ScreenUtil().setHeight(120.0);
    snackBarHeight = ScreenUtil().setHeight(50.0);
    texIconSize = ScreenUtil().setWidth(30.0);

    /*Default Height&Width*/
    defaultIndicatorHeight = ScreenUtil().setHeight(5.0);
    defaultIndicatorWidth = screenWidthFourth;
  }
}

class FontSize {
  static double s7 = 7.0;
  static double s8 = 8.0;
  static double s9 = 9.0;
  static double s10 = 10.0;
  static double s11 = 11.0;
  static double s12 = 12.0;
  static double s13 = 13.0;
  static double s14 = 14.0;
  static double s15 = 15.0;
  static double s16 = 16.0;
  static double s17 = 17.0;
  static double s18 = 18.0;
  static double s19 = 19.0;
  static double s20 = 20.0;
  static double s21 = 21.0;
  static double s22 = 22.0;
  static double s23 = 23.0;
  static double s24 = 24.0;
  static double s25 = 25.0;
  static double s26 = 26.0;
  static double s27 = 27.0;
  static double s28 = 28.0;
  static double s29 = 29.0;
  static double s30 = 30.0;
  static double s32 = 32.0;
  static double s34 = 34.0;
  static double s36 = 36.0;
  static double s38 = 38.0;
  static double s40 = 40.0;
  static double s48 = 48.0;

  static setDefaultFontSize() {
    s7 = 7.0;
    s8 = 8.0;
    s9 = 9.0;
    s10 = 10.0;
    s11 = 11.0;
    s12 = 12.0;
    s13 = 13.0;
    s14 = 14.0;
    s15 = 15.0;
    s16 = 16.0;
    s17 = 17.0;
    s18 = 18.0;
    s19 = 19.0;
    s20 = 20.0;
    s21 = 21.0;
    s22 = 22.0;
    s23 = 23.0;
    s24 = 24.0;
    s25 = 25.0;
    s26 = 26.0;
    s27 = 27.0;
    s28 = 28.0;
    s29 = 29.0;
    s30 = 30.0;
    s32 = 32.0;
    s34 = 34.0;
    s36 = 36.0;
    s38 = 38.0;
    s48 = 48.0;
  }

  static setScreenAwareFontSize() {
    s7 = ScreenUtil().setSp(7);
    s8 = ScreenUtil().setSp(8.0);
    s9 = ScreenUtil().setSp(9.0);
    s10 = ScreenUtil().setSp(10.0);
    s11 = ScreenUtil().setSp(11.0);
    s12 = ScreenUtil().setSp(12.0);
    s13 = ScreenUtil().setSp(13.0);
    s14 = ScreenUtil().setSp(14.0);
    s15 = ScreenUtil().setSp(15.0);
    s16 = ScreenUtil().setSp(16.0);
    s17 = ScreenUtil().setSp(17.0);
    s18 = ScreenUtil().setSp(18.0);
    s19 = ScreenUtil().setSp(19.0);
    s20 = ScreenUtil().setSp(20.0);
    s21 = ScreenUtil().setSp(21.0);
    s22 = ScreenUtil().setSp(22.0);
    s23 = ScreenUtil().setSp(23.0);
    s24 = ScreenUtil().setSp(24.0);
    s25 = ScreenUtil().setSp(25.0);
    s26 = ScreenUtil().setSp(26.0);
    s27 = ScreenUtil().setSp(27.0);
    s28 = ScreenUtil().setSp(28.0);
    s29 = ScreenUtil().setSp(29.0);
    s30 = ScreenUtil().setSp(30.0);
    s32 = ScreenUtil().setSp(32.0);
    s34 = ScreenUtil().setSp(34.0);
    s36 = ScreenUtil().setSp(36.0);
    s38 = ScreenUtil().setSp(38.0);
    s40 = ScreenUtil().setSp(40.0);
    s48 = ScreenUtil().setSp(48.0);
  }
}
