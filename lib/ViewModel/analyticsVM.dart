import 'package:flutter/material.dart';
import 'package:vvt_demo/Model/population.dart';
import 'package:vvt_demo/Services/analytics.dart';

class AnalyticsVM extends ChangeNotifier {
  BuildContext context;
  bool isLoading = false;
  List<Population> analyticsData=[];
 

  AnalyticsVM(this.context){
    getAnalyticsData();
  }

  Future<void> getAnalyticsData() async {
    isLoading = true;
    analyticsData = await AnalyticsService().getAnalyticsData();
    print(analyticsData.length);
    isLoading = false;
    notifyListeners();
  }

 
 
}
