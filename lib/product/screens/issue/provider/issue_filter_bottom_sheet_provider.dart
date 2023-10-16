import 'package:flutter/material.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';

class IssueFilterModalBottomSheetProvider extends ChangeNotifier {
  List<String> choosenFilterList = [];
  List<String> tempChoosenFilterList = [];
  String choosenBuilding = '';
  String choosenFloor = '';
  String choosenWing = '';

  void setChoosenBuilding(String building) {
    tempChoosenFilterList.add(building);
    choosenBuilding = building;
    notifyListeners();
  }

  void setChoosenFloor(String floor) {
    tempChoosenFilterList.add(floor);
    choosenBuilding = floor;
    notifyListeners();
  }

  void setChoosenWing(String wing) {
    tempChoosenFilterList.add(wing);
    choosenBuilding = wing;
    notifyListeners();
  }

  void removeItemFromTempFilterList(String item) {
    tempChoosenFilterList.remove(item);
    notifyListeners();
  }

  void setChoosenFilterList() {
    choosenFilterList = List.from(tempChoosenFilterList);
    notifyListeners();
  }

  void clearList() async {
    tempChoosenFilterList = List.from(choosenFilterList);
    await Future.delayed(const Duration(seconds: 2), () {});
    notifyListeners();
  }

  void deleteServiceCodes(IssueProvider issueProvider) {
    List<String> differentItems = [];

    for (var item in choosenFilterList) {
      if (!tempChoosenFilterList.contains(item)) {
        differentItems.add(item);
      }
    }

    for (var item in differentItems) {
      if (issueProvider.buildingFilterNames.contains(item)) {
        issueProvider.clearBuildCode();
      }
      if (issueProvider.floorFilterNames.contains(item)) {
        issueProvider.clearFloorCode();
      }
      if (issueProvider.wingFilterNames.contains(item)) {
        issueProvider.clearWingCode();
      }
    }
  }
}
