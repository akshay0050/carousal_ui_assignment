import 'dart:convert';

import 'package:carousel_ui_assignment/services/api_services.dart';
import 'package:carousel_ui_assignment/services/fetch_json_service.dart';
import 'package:carousel_ui_assignment/services/models/album_data.dart';
import 'package:carousel_ui_assignment/services/models/app_state_enum.dart';
import 'package:carousel_ui_assignment/services/models/first_page_model.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

/// This is view model class which helpful to pass data from Model to view
class FirstPageViewModel extends ChangeNotifier {
  AppState state;
  String errMessage;
  List<AlbumData> dataList;
  final BuildContext context;
  FirstPageModel model;

  FirstPageViewModel(this.context){
    fetchAllData();
  }

  /// fetch data from json
  Future fetchAllData() async{
    try {
      state = AppState.loading;
      notifyListeners();
      String data = await FetchJsonService.loadDataFromAsset("assets/json/first_page_get.json",context);
      model = FirstPageModel.fromJson(json.decode(data));
      if(model != null ) {
        state = AppState.success;
      }else {
        this.errMessage = "No data found";
        state = AppState.failed;
      }
    } on Exception catch(_) {
      this.errMessage = "Please go back online";
      state = AppState.failed;
    }
    catch(_){
      this.errMessage = "Please go back online";
      state = AppState.failed;
    }
    notifyListeners();
  }

}