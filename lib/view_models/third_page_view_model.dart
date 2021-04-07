import 'package:carousel_ui_assignment/services/api_services.dart';
import 'package:carousel_ui_assignment/services/models/album_data.dart';
import 'package:carousel_ui_assignment/services/models/app_state_enum.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

class ThirdPageViewModel extends ChangeNotifier {
  AppState state;
  String errMessage;
  List<AlbumData> dataList;
  final BuildContext context;

  ThirdPageViewModel(this.context){
    fetchAllData();
  }

  /// calling get api with the help of chopper
  Future fetchAllData() async{
    try {
      state = AppState.loading;
      notifyListeners();
      Response response = await ApiService.create().getAllData();
      if (response != null && response.body != null && response.statusCode == 200) {
        dataList = [];
        var responseList = response.body;
        responseList.forEach((v) {this.dataList.add(AlbumData.fromJson(v)); });
        if(dataList.length > 0) {
          state = AppState.success;
        }else {
          this.errMessage = "No data found";
          state = AppState.failed;
        }
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