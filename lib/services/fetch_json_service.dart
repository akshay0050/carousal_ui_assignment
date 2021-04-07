import 'package:flutter/cupertino.dart';

class FetchJsonService{
  ///this class act as a Model in MVVM to get data
  static Future<String> loadDataFromAsset(String path,BuildContext context) async{
    return  await DefaultAssetBundle.of(context)
        .loadString(path);
  }
}