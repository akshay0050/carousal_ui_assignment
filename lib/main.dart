import 'package:carousel_ui_assignment/ui_classes/first_page.dart';
import 'package:carousel_ui_assignment/ui_classes/second_page.dart';
import 'package:carousel_ui_assignment/ui_classes/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == '/') {
          return PageRouteBuilder(pageBuilder: (_, a1, a2) => FirstPage());
        } if (routeSettings.name == SecondPage.route) {
          return PageRouteBuilder(pageBuilder: (_, a1, a2) => SecondPage());
        } if(routeSettings.name == ThirdPage.route) {
          return PageRouteBuilder(pageBuilder: (_, a1, a2) => ThirdPage());
        }
        else {
          return PageRouteBuilder(pageBuilder: (_, a1, a2) => FirstPage());
        }
      },
      //home: FirstPage(),
    );
  }
}


