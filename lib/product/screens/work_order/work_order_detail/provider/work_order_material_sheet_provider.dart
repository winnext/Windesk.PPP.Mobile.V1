import 'package:flutter/material.dart';

class WorkOrderMaterialSheetProvider extends ChangeNotifier {
  bool init = true;

  void getStores() {
    if (init) {
      init = false;
      notifyListeners();
    }
  }
}
