import 'package:flutter/material.dart';

class WorkOrderEffortSheetProvider extends ChangeNotifier {
  String choosenEffortType = '15 dk';
  int choosenEffortDay = 0;
  int choosenEffortHour = 0;
  int choosenEffortMinute = 0;

  void onChangedChoosenEffortDuration(String val) {
    choosenEffortType = val;
    notifyListeners();
  }

  void onChangedChoosenEffortDay(int val) {
    choosenEffortDay = val;
    notifyListeners();
  }

  void onChangedChoosenEffortHour(int val) {
    choosenEffortHour = val;
    notifyListeners();
  }

  void onChangedChoosenEffortMinute(int val) {
    choosenEffortMinute = val;
    notifyListeners();
  }
}
