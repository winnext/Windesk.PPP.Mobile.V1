import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_available_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_live_select_asg_groups_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_live_select_asg_users_model.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_operation_list_model.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';
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

  bool _isSuccessTakeOver = false;
  bool get isSuccessTakeOver => _isSuccessTakeOver;

  bool isSuccessEnterActivity = false;
  bool isSuccessChangeCfg = false;

  bool _errorAccur = false;
  bool get errorAccur => _errorAccur;

  String _selectedActivityName = '';
  String get selectedActivityName => _selectedActivityName;

  String _additionaltimeInput = '';
  String get additionaltimeInput => _additionaltimeInput;

  String _description = '';
  String get description => _description;

  String _selectedAsgGroupName = '';
  String get selectedAsgGroupName => _selectedAsgGroupName;

  String _selectedAsgGroupCode = '';
  String get selectedAsgGroupCode => _selectedAsgGroupCode;

  String _selectedAsgUserCode = '';
  String get selectedAsgUserCode => _selectedAsgUserCode;

  String _selectedActivityCode = '';
  String get selectedActivityCode => _selectedActivityCode;

  String _barcodeScenRes = '';
  String get barcodeScenRes => _barcodeScenRes;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _isBarcodeSpace = false;
  bool get isBarcodeSpace => _isBarcodeSpace;

  bool _isadditionaltimeInput = false;
  bool get isadditionaltimeInput => _isadditionaltimeInput;

  bool _minDescLength = false;
  bool get minDescLength => _minDescLength;

  bool _mobilePhoto = false;
  bool get mobilePhoto => _mobilePhoto;

  bool _isassigneeccType = false;
  bool get isassigneeccType => _isassigneeccType;

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

  final List<IssueAvailableActivities> _availableActivities = [];
  List<IssueAvailableActivities> get availableActivities => _availableActivities;

  final List<String> _availableActivitiesName = [];
  List<String> get availableActivitiesName => _availableActivitiesName;

  final List<LiveSelectAsgGroupsModel> _getLiveSelectAsgGroups = [];
  List<LiveSelectAsgGroupsModel> get getLiveSelectAsgGroups => _getLiveSelectAsgGroups;

  final List<String> _getLiveSelectAsgGroupsName = [];
  List<String> get getLiveSelectAsgGroupsName => _getLiveSelectAsgGroupsName;

  final List<LiveSelectAsgUsersModel> _getLiveSelectAsgUsers = [];
  List<LiveSelectAsgUsersModel> get getLiveSelectAsgUsers => _getLiveSelectAsgUsers;

  final List<String> _getLiveSelectAsgUsersName = [];
  List<String> get getLiveSelectAsgUsersName => _getLiveSelectAsgUsersName;

  final List<IssueAvailableActivities> _selectedActivity = [];
  List<IssueAvailableActivities> get selectedActivity => _selectedActivity;

  File? _image;
  File? get image => _image;

  void setFile(File file) {
    _image = file;
    notifyListeners();
  }

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

  void setadditionaltimeInput(String additionaltime) {
    _additionaltimeInput = additionaltime;
    notifyListeners();
  }

  void setdescription(String description) {
    _description = description;
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

  void update() {
    notifyListeners();
  }

  void setSelectedActivityName(String activityName) {
    _selectedActivityName = activityName;
    clearAll();
    for (int i = 0; i < _availableActivities.length; i++) {
      if (_availableActivities[i].name == activityName) {
        _isBarcodeSpace = _availableActivities[i].barcodeSpace == 'Y' ? true : false;
        _isadditionaltimeInput = _availableActivities[i].additionaltimeInput == 'Y' ? true : false;
        _minDescLength = _availableActivities[i].minDescLength != null ? true : false;
        _mobilePhoto = _availableActivities[i].mobilePhoto == 'Y' ? true : false;
        _isassigneeccType = _availableActivities[i].assigneeccType == 'LIVESELECT' ? true : false;
        _selectedActivityCode = _availableActivities[i].code.toString();
      }
    }
    notifyListeners();
  }

  void setSelectedAsgGroups(String issueCode, String asgGroupCode) async {
    _selectedAsgGroupName = asgGroupCode;
    getLiveSelectAsgUsers.clear();
    getLiveSelectAsgUsersName.clear();
    selectedActivity.clear();
    for (int i = 0; i < _getLiveSelectAsgGroups.length; i++) {
      if (_getLiveSelectAsgGroups[i].name == asgGroupCode) {
        _selectedAsgGroupCode = _getLiveSelectAsgGroups[i].code ?? '';
        getLiveSelectAsgUsersFunc(issueCode, _selectedAsgGroupCode);
      }
    }
    notifyListeners();
  }

  void setSelectedAsgUser(String asgUserName) async {
    selectedActivity.clear();
    for (int i = 0; i < _getLiveSelectAsgUsers.length; i++) {
      if (_getLiveSelectAsgUsers[i].fullname == asgUserName) {
        _selectedAsgUserCode = _getLiveSelectAsgUsers[i].code ?? '';
      }
    }
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

  void takeOverIssue(issuecode, BuildContext context) async {
    _loading = true;
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    String userCode = await SharedManager().getString(SharedEnum.userCode);

    final response = await _issueServiceRepository.takeOverIssue(userToken, userCode, issuecode);
    response.fold(
        (l) => {
              snackBar(context, LocaleKeys.processDone, 'success'),
              Navigator.of(context).pop<bool>(true),
            },
        (r) => {
              snackBar(context, LocaleKeys.processCancell, 'error'),
              Navigator.of(context).pop<bool>(false),
            });

    _loading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 10), () {
      _isSuccessTakeOver = false;
      _errorAccur = false;
      notifyListeners();
    });
  }

  void createSparepartIssue(issuecode, BuildContext context) async {
    _loading = true;
    String userToken = await SharedManager().getString(SharedEnum.deviceId);

    final response = await _issueServiceRepository.createSparepartIssue(userToken, issuecode);
    response.fold(
        (l) => {
              snackBar(context, LocaleKeys.processDone, 'success'),
              Navigator.of(context).pop<bool>(true),
            },
        (r) => {
              snackBar(context, LocaleKeys.processCancell, 'error'),
              Navigator.of(context).pop<bool>(false),
            });

    _loading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isSuccessTakeOver = false;
      _errorAccur = false;
      notifyListeners();
    });
  }

  void cancelIssuePlanned(issuecode, BuildContext context) async {
    _loading = true;

    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    String userName = await SharedManager().getString(SharedEnum.userName);

    final response = await _issueServiceRepository.cancelIssuePlanned(userToken, userName, issuecode);
    response.fold(
        (l) => {
              snackBar(context, LocaleKeys.processDone, 'success'),
              Navigator.of(context).pop<bool>(true),
            },
        (r) => {
              snackBar(context, LocaleKeys.processCancell, 'error'),
              Navigator.of(context).pop<bool>(false),
            });

    _loading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      _isSuccessTakeOver = false;
      _errorAccur = false;
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
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'İptal', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setEntityCode = '';
    setSerialNumber = '';
    setRfidCode = '';
    setSpaceCode = '';

    if (barcodeScanRes != '-1') {
      String barcode = barcodeScanRes.toString();
      _barcodeScenRes = barcodeScenRes;
      if (barcode.contains("=")) {
        List barcodeScenResSplit = barcode.split("=");
        barcode = barcodeScenResSplit[1].toString();
        _barcodeScenRes = barcode;
      }
      if (state == 'entitiy') {
        setEntityCode = barcode;
      } else if (state == 'serialNumber') {
        setSerialNumber = barcode;
      } else if (state == 'rfid') {
        setRfidCode = barcode;
      } else if (state == 'space') {
        setSpaceCode = barcode;
      }
    }
    notifyListeners();
  }

  void getLiveSelectAsgGroupsFunc(String issuecode) async {
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    _loading = true;
    notifyListeners();
    final response = await _issueServiceRepository.getLiveSelectAsgGroups(issuecode, userToken);

    _getLiveSelectAsgGroupsName.clear();
    _getLiveSelectAsgGroups.clear();
    response.fold(
        (l) => {
              _getLiveSelectAsgGroups.addAll(l),
              for (int i = 0; i < _getLiveSelectAsgGroups.length; i++)
                {
                  _getLiveSelectAsgGroupsName.add(_getLiveSelectAsgGroups[i].name.toString()),
                },
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    _isassigneeccType = false;
    notifyListeners();
  }

  void getLiveSelectAsgUsersFunc(String issuecode, String groupCode) async {
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    _loading = true;
    notifyListeners();
    final response = await _issueServiceRepository.getLiveSelectAsgUser(issuecode, userToken, groupCode);

    _getLiveSelectAsgUsersName.clear();
    _getLiveSelectAsgUsers.clear();
    response.fold(
        (l) => {
              _getLiveSelectAsgUsers.addAll(l),
              for (int i = 0; i < _getLiveSelectAsgUsers.length; i++)
                {
                  _getLiveSelectAsgUsersName.add(_getLiveSelectAsgUsers[i].fullname.toString()),
                },
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    _isFetchActivity = false;
    notifyListeners();
  }

  void saveIssueActivity(String issuecode, IssueProvider issueProvider) async {
    _loading = true;

    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    String userCode = await SharedManager().getString(SharedEnum.userCode);

    Uint8List? imagebytes = await image?.readAsBytes(); //convert to bytes
    String base64string = '';
    if (imagebytes != null) {
      base64string = base64.encode(imagebytes); //convert bytes to base64 string
    }
    notifyListeners();

    final response = await _issueServiceRepository.saveIssueActivity(
      issuecode,
      userToken,
      selectedAsgGroupCode,
      userCode,
      selectedActivityCode,
      description,
      spaceCode.text,
      selectedAsgUserCode,
      additionaltimeInput,
      'issue',
      base64string,
    );
    response.fold(
        (l) => {
              isSuccessEnterActivity = true,
              _loading = false,
            },
        (r) => {
              _loading = false,
              _errorAccur = true,
            });
    _isFetchActivity = false;

    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      isSuccessEnterActivity = false;
      _errorAccur = false;
      notifyListeners();
    });
  }

  void changeCfg(issuecode) async {
    _loading = true;

    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    _barcodeScenRes = serialNumber.text.isNotEmpty ? serialNumber.text : _barcodeScenRes;
    _barcodeScenRes = entityCode.text.isNotEmpty ? entityCode.text : _barcodeScenRes;
    _barcodeScenRes = rfidCode.text.isNotEmpty ? rfidCode.text : _barcodeScenRes;

    final response = await _issueServiceRepository.changeCfg(userToken, issuecode, barcodeScenRes);

    response.fold(
        (l) => {
              isSuccessChangeCfg = true,
            },
        (r) => {
              _errorAccur = true,
              _errorMessage = r.message,
            });
    _loading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      isSuccessChangeCfg = false;
      _errorAccur = false;
      notifyListeners();
    });
  }

  void clearAll() {
    getLiveSelectAsgGroupsName.clear();
    getLiveSelectAsgGroups.clear();
    getLiveSelectAsgUsers.clear();
    getLiveSelectAsgUsersName.clear();
    _isBarcodeSpace = false;
    _isadditionaltimeInput = false;
    _minDescLength = false;
    _mobilePhoto = false;
    _isassigneeccType = false;
    _selectedActivityCode = '';
  }
}
