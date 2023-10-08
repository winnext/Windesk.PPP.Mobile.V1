import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_available_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_operation_list_model.dart';
import 'package:wm_ppp_4/product/screens/issue/service/issue_service_repo_impl.dart';

class IssueActionProvider extends ChangeNotifier {
  final IssueServiceRepoImpml _issueServiceRepository = IssueServiceRepoImpml();

  bool _isFetch = false;
  bool get isFetch => _isFetch;

  bool _isFetchActivity = true;
  bool get isFetchActivity => _isFetchActivity;

  bool _isPhotoSectionOpen = false;
  bool get isPhotoSectionOpen => _isPhotoSectionOpen;

  bool _isActivitySectionOpen = false;
  bool get isActivitySectionOpen => _isActivitySectionOpen;

  bool _isCfgSectionOpen = false;
  bool get isCfgSectionOpen => _isCfgSectionOpen;

  bool _isTakeOverSectionOpen = false;
  bool get isTakeOverSectionOpen => _isTakeOverSectionOpen;

  bool _isPlannedCancelSectionOpen = false;
  bool get isPlannedCancelSectionOpen => _isPlannedCancelSectionOpen;

  bool _isSparepartSectionOpen = false;
  bool get isSparepartSectionOpen => _isSparepartSectionOpen;

  bool _loading = false;
  bool get loading => _loading;

  bool isSuccessTakeOver = false;
  bool errorAccur = false;

  String _selectedActivityName = '';
  String get selectedActivityName => _selectedActivityName;

    final _entityCode = TextEditingController();

  TextEditingController get entityCode => _entityCode;

  set setEntityCode(String entityCode) {
    _entityCode.text = entityCode;
    notifyListeners();
  }

  final _serialNumber = TextEditingController();

  TextEditingController get serialNumber => _serialNumber;

  set setSerialNumber(String serialNumber) {
    _serialNumber.text = serialNumber;
    notifyListeners();
  }

  final _rfidCode = TextEditingController();

  TextEditingController get rfidCode => _rfidCode;

  set setRfidCode(String rfidCode) {
    _rfidCode.text = rfidCode;
    notifyListeners();
  }

  final _spaceCode = TextEditingController();
  
  TextEditingController get spaceCode => _spaceCode;

  set setSpaceCode(String spaceCode) {
    _spaceCode.text = spaceCode;
    notifyListeners();
  }


  IssueOperationList _issueOperationList = const IssueOperationList();
  IssueOperationList get issueOperationList => _issueOperationList;

  List<IssueAvailableActivities> _availableActivities = [];
  List<IssueAvailableActivities> get availableActivities => _availableActivities;

  List<String> _availableActivitiesName = [];
  List<String> get availableActivitiesName => _availableActivitiesName;

  List<IssueAvailableActivities> _selectedActivity = [];
  List<IssueAvailableActivities> get selectedActivity => _selectedActivity;

  void setisPhotoSectionOpen(bool photoSection) {
    _isPhotoSectionOpen = photoSection;
    notifyListeners();
  }

  void setisActivitySectionOpen(bool activitySection) {
    _isActivitySectionOpen = activitySection;
    notifyListeners();
  }

  void setisCfgSectionOpen(bool cfgSection) {
    _isCfgSectionOpen = cfgSection;
    notifyListeners();
  }

  void setisTakeOverSectionOpen(bool takeOverSectionOpen) {
    _isTakeOverSectionOpen = takeOverSectionOpen;
    notifyListeners();
  }

  void setisPlannedSectionOpen(bool plannedSection) {
    _isPlannedCancelSectionOpen = plannedSection;
    notifyListeners();
  }

  void setisSparepartSectionOpen(bool sparePartSection) {
    _isSparepartSectionOpen = sparePartSection;
    notifyListeners();
  }
    void scanEntityCode() async {
    scanBarcodeAndQr('entitiy');
  }

  void scanSerialNumber() async {
    scanBarcodeAndQr('serialNumber');
  }

  void scanRfid() async {
    scanBarcodeAndQr('rfid');
  }

  void scanSpace() async {
    scanBarcodeAndQr('space');
  }

  void setSelectedActivityName(String activityName) {
    _selectedActivityName = activityName;
    selectedActivity.clear();
    for (int i = 0; i < _availableActivities.length; i++) {
      if (_availableActivities[i].name == activityName) {
        selectedActivity.add(_availableActivities[i]);
      }
    }
    print(selectedActivity);
    notifyListeners();
  }

  void getIssueOperations(String issuecode) async {
    _isFetch = true;
    _loading = true;
    notifyListeners();
    final response = await _issueServiceRepository.getIssueOperations(issuecode);
    response.fold(
        (l) => {
              _issueOperationList = l,
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    notifyListeners();
  }

  void takeOverIssue(issuecode) async {
    _loading = true;

    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    String userName = await SharedManager().getString(SharedEnum.userName);

    final response = await _issueServiceRepository.takeOverIssue(userToken, userName, issuecode);
    response.fold(
        (l) => {
              isSuccessTakeOver = true,
            },
        (r) => {
              errorAccur = true,
            });

    _loading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      isSuccessTakeOver = false;
      errorAccur = false;
      notifyListeners();
    });
  }

  void getAvailableActivities(String issuecode) async {
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    _loading = true;
    notifyListeners();
    final response = await _issueServiceRepository.getAvailableActivities(issuecode, userToken);

    _availableActivitiesName.clear();
    _availableActivities.clear();
    response.fold(
        (l) => {
              _availableActivities.addAll(l),
              for (int i = 0; i < _availableActivities.length; i++)
                {
                  _availableActivitiesName.add(_availableActivities[i].name.toString()),
                },
              print(_availableActivitiesName),
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    _isFetchActivity = false;
    notifyListeners();
  }

    void scanBarcodeAndQr(state) async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'İptal', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (barcodeScanRes != '-1') {
      if (state == 'entitiy') {
        setEntityCode = barcodeScanRes;
      } else if (state == 'serialNumber') {
        setSerialNumber = barcodeScanRes;
      } else if (state == 'rfid') {
        setRfidCode = barcodeScanRes;
      } else if (state == 'space') {
        setSpaceCode = barcodeScanRes;
      }
    }
    notifyListeners();
  }
}
