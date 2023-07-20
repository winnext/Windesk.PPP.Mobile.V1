import 'package:flutter/material.dart';
import 'package:wm_ppp_4/product/screens/test/service/test_service_repo_impl.dart';

class TestProvider extends ChangeNotifier {
  void checkUserAlreadyLoggedIn() {}

  String _accessTestV1 = 'loading';
  get accessTestV1 => _accessTestV1;

  set setAccessTestV1(String accessTestV1) {
    _accessTestV1 = accessTestV1;
    notifyListeners();
  }

  String _accessTestV2 = 'loading';
  get accessTestV2 => _accessTestV2;

  set setAccessTestV2(String accessTestV2) {
    _accessTestV2 = accessTestV2;
    notifyListeners();
  }

  void accessTestV1Function() async {
    var accesTestResult = await TestServiceRepositoryImpl().accessTestWindesk();
    accesTestResult.fold(
        (l) => {setAccessTestV1 = 'true'}, (r) => setAccessTestV1 = 'false');
    notifyListeners();
  }

  void accessTestV2Function() async {
    var accesTestResult = await TestServiceRepositoryImpl().accessTestWindesk();
    accesTestResult.fold(
        (l) => {setAccessTestV2 = 'true'}, (r) => setAccessTestV2 = 'false');
    notifyListeners();
  }
}
