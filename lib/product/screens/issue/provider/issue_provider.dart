// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_attachments_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_filter_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_filter_status_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_summary_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_summary_time_model.dart';

import '../../../../feature/models/issue_models/issue_list_model.dart';
import '../../../../feature/models/issue_models/issue_tracing_list_model.dart';
import '../service/issue_service_repo_impl.dart';

class IssueProvider extends ChangeNotifier {
  final IssueServiceRepoImpml _issueServiceRepository = IssueServiceRepoImpml();

  bool _loading = false;
  bool get loading => _loading;

  bool _isFetch = false;
  bool get isFetch => _isFetch;
  set setisFetch(bool value) {
    _isFetch = false;
    notifyListeners();
  }

  //geri alınacak
  // IssueProvider() {
  //   _getUsercode();
  //   timer = Timer.periodic(
  //       const Duration(seconds: 1), (Timer t) => getCurrentTime());
  // }

  bool _isFetchFilter = false;
  bool get isFetchFilter => _isFetchFilter;

  void setFetch() {
    _isFetch = false;
    notifyListeners();
  }

  late final Timer timer;
  String currentTimeText = '';
  String title = '';
  var secondText = 60;
  String issueModuleCode = '';
  //geri alınacak
  // void getCurrentTime() {
  //   currentTimeText = DateTime.now().toString().substring(0, 19);
  //   secondText = secondText - 1;
  //   if (secondText == 0) {
  //     secondText = 60;
  //     _loading = true;
  //     getIssueList(1, issueModuleCode);
  //     Future.delayed(const Duration(milliseconds: 1000), () {
  //       _loading = false;
  //     });
  //   }
  //   notifyListeners();
  // }

  void setIssueModuleCode(val) {
    issueModuleCode = val;
    notifyListeners();
  }

  void setSecond() {
    secondText = 60;
    notifyListeners();
  }

  void closeTimer() {
    timer.cancel();
  }

  void _getUsercode() async {
    await SharedManager()
        .getString(SharedEnum.userCode)
        .then((value) => title = value);
    notifyListeners();
  }

  bool _isFetchSummary = false;
  bool get isFetchSummary => _isFetchSummary;
  set setisFetchSummary(bool value) {
    _isFetchSummary = false;
    notifyListeners();
  }

  bool _isFetchAttachment = false;
  bool get isFetchAttachment => _isFetchAttachment;

  String _moduleCode = '';
  String get moduleCode => _moduleCode;
  set setmoduleCode(String moduleCode) {
    _moduleCode = moduleCode;
    notifyListeners();
  }

  String _moduleName = '';
  String get moduleName => _moduleName;
  set setmoduleName(String moduleName) {
    _moduleName = moduleName;
    notifyListeners();
  }

  String _statusName = '';
  String get statusName => _statusName;
  void setstatusName(String statusName) {
    _statusName = statusName;
    if (statusName == '') {
      _statusName = '';
      _statusCode = '';
      notifyListeners();
    }
    for (int i = 0; i < _issueStatusCodes.length; i++) {
      if (_issueStatusCodes[i].name == statusName) {
        setstatusCode = _issueStatusCodes[i].code.toString();
      }
    }
    notifyListeners();
  }

  String _statusCode = '';
  String get statusCode => _statusCode;
  set setstatusCode(String statusCode) {
    _statusCode = statusCode;
    notifyListeners();
  }

  String _buildName = '';
  String get buildName => _buildName;
  void setbuildName(String buildName) {
    if (buildName == '') {
      _buildName = '';
      _buildCode = '';
      notifyListeners();
    }
    for (int i = 0; i < _buildingFilterValues.length; i++) {
      if (_buildingFilterValues[i].name == buildName) {
        setbuildCode = _buildingFilterValues[i].code.toString();
      }
    }
    _buildName = buildName;
    notifyListeners();
  }

  String _buildCode = '';
  String get buildCode => _buildCode;
  set setbuildCode(String buildCode) {
    _buildCode = buildCode;
    notifyListeners();
  }

  String _floorName = '';
  String get floorName => _floorName;
  void setfloorName(String floorName) {
    for (int i = 0; i < _floorFilterValues.length; i++) {
      if (_floorFilterValues[i].name == floorName) {
        setfloorCode = _floorFilterValues[i].code.toString();
      }
    }
    _floorName = floorName;
    notifyListeners();
  }

  String _floorCode = '';
  String get floorCode => _floorCode;
  set setfloorCode(String floorCode) {
    _floorCode = floorCode;
    notifyListeners();
  }

  String _wingName = '';
  String get wingName => _wingName;
  void setwingName(String wingName) {
    for (int i = 0; i < _wingFilterValues.length; i++) {
      if (_wingFilterValues[i].name == wingName) {
        setwingCode = _wingFilterValues[i].code.toString();
      }
    }
    _wingName = wingName;
    notifyListeners();
  }

  void clearWingCode() {
    _wingCode = '';
  }

  void clearFloorCode() {
    _floorCode = '';
  }

  void clearBuildCode() {
    _buildCode = '';
  }

  void clearStatusCode() {
    _statusCode = '';
  }

  void clearAssigneName() {
    _assigne = '';
  }

  String _wingCode = '';
  String get wingCode => _wingCode;
  set setwingCode(String wingCode) {
    _wingCode = wingCode;
    notifyListeners();
  }

  String _assigne = '';
  String get assigne => _assigne;
  void setassigne() async {
    String userToken = await SharedManager().getString(SharedEnum.userCode);
    if (_assigne == '') {
      _assigne = userToken;
    } else {
      _assigne = '';
    }
    notifyListeners();
  }

  String _issueListType = '';
  String get issueListType => _issueListType;
  set setissueListType(String issueListType) {
    _issueListType = issueListType;
    notifyListeners();
  }

  int _currentPage = 1;
  int get currentPage => _currentPage;
  set setcurrentPage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  bool _totalRecordCount = false;
  bool get totalRecordCount => _totalRecordCount;

  List<IssueTracingListModel> _tracingList = [];
  List<IssueTracingListModel> get tracingList => _tracingList;

  List<IssueListModel> _issueList = [];
  List<IssueListModel> get issueList => _issueList;

  IssueSummaryModel _issueSummaryDetail = const IssueSummaryModel();
  IssueSummaryModel get issueSummaryDetail => _issueSummaryDetail;

  IssueSummaryTimeModel _issueSummaryTimeInfo = const IssueSummaryTimeModel();
  IssueSummaryTimeModel get issueSummaryTimeInfo => _issueSummaryTimeInfo;

  List<IssueActivitiesModel> _issueActivities = [];
  List<IssueActivitiesModel> get issueActivities => _issueActivities;

  List<IssueAttachmentsModel> _issueAttachmentList = [];
  List<IssueAttachmentsModel> get issueAttachmentList => _issueAttachmentList;

  List<IssueFilterStatusModel> _issueStatusCodes = [];
  List<IssueFilterStatusModel> get issueStatusCodes => _issueStatusCodes;

  List<String> _issueStatusNames = ['Seçiniz'];
  List<String> get issueStatusNames => _issueStatusNames;

  List<IssueFilterModel> _buildingFilterValues = [];
  List<IssueFilterModel> get buildingFilterValues => _buildingFilterValues;

  List<String> _buildingFilterNames = ['Seçiniz'];
  List<String> get buildingFilterNames => _buildingFilterNames;

  List<String> _selectedFilterList = [];
  List<String> get selectedFilterList => _selectedFilterList;

  List<IssueFilterModel> _floorFilterValues = [];
  List<IssueFilterModel> get floorFilterValues => _floorFilterValues;

  List<String> _floorFilterNames = ['Seçiniz'];
  List<String> get floorFilterNames => _floorFilterNames;

  List<IssueFilterModel> _wingFilterValues = [];
  List<IssueFilterModel> get wingFilterValues => _wingFilterValues;

  List<String> _wingFilterNames = ['Seçiniz'];
  List<String> get wingFilterNames => _wingFilterNames;

  bool notificationController(ScrollNotification scrollInfo) {
    if (!loading &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      if (_totalRecordCount == true) {
        return false;
      }
      _currentPage = 1 + _currentPage;
      getIssueList(_currentPage, issueListType);
      notifyListeners();
    } else {}
    return false;
  }

  void getIssueTracingList() async {
    _isFetch = true;
    _loading = true;
    notifyListeners();
    final response = await _issueServiceRepository.getIssueTracingList();
    response.fold(
        (l) => {
              _tracingList = l,
              _loading = false,
              notifyListeners(),
            },
        (r) => {
              _loading = false,
              notifyListeners(),
            });
  }

  void getIssueList(int index, String issueListType) async {
    int startIssues = index == 1 ? 0 : (index - 1) * 10;
    int endIsses = index * 10;

    Map<String, dynamic> queryParameters = {
      "start": startIssues,
      "end": endIsses,
      "status": statusCode,
      "build": buildCode,
      "floor": floorCode,
      "wing": wingCode,
      "assignee": assigne,
    };

    _isFetch = true;
    _loading = true;
    _issueListType = issueListType;
    notifyListeners();
    final response = await _issueServiceRepository.getIssueList(
        queryParameters, issueListType);
    response.fold(
        (l) => {
              _issueList.clear(),
              _issueList.addAll(l),
              _loading = false,
              l.length % 10 == 0 ? null : _totalRecordCount = true,
              notifyListeners(),
            },
        (r) => {
              _loading = false,
            });

    notifyListeners();
  }

  void getIssueSummary(String issuecode) async {
    _isFetch = true;
    _loading = true;
    notifyListeners();
    final response = await _issueServiceRepository.getIssueSummary(issuecode);
    response.fold(
        (l) => {
              _issueSummaryDetail = l,
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  void getIssueTimeInfo(String issuecode) async {
    _isFetchSummary = true;
    _loading = true;
    notifyListeners();
    print('girdi fetchIsSummary');
    final response = await _issueServiceRepository.getIssueTimeInfo(issuecode);
    response.fold(
        (l) => {
              _issueSummaryTimeInfo = l,
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    notifyListeners();
  }

  void getIssueActivities(String issuecode) async {
    _isFetch = true;
    _loading = true;
    _issueActivities.clear();
    notifyListeners();
    final response =
        await _issueServiceRepository.getIssueActivities(issuecode);
    response.fold(
        (l) => {
              _issueActivities.addAll(l),
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    notifyListeners();
  }

  void getIssueAttachment(String issuecode) async {
    _isFetchAttachment = true;
    _loading = true;
    notifyListeners();
    final response =
        await _issueServiceRepository.getIssueAttachment(issuecode);

    response.fold(
        (l) => {
              _issueAttachmentList.addAll(l),
              _loading = false,
            },
        (r) => {
              _loading = false,
            });
    notifyListeners();
  }

  void getFilterValues() async {
    _isFetchFilter = true;
    getSpaceBfwByType('BUILDING');
    getSpaceBfwByType('FLOOR');
    getSpaceBfwByType('WING');
    getIssueOpenStatusCodes();
  }

  void clearFilterCodes() async {
    setbuildCode = '';
    setfloorCode = '';
    setwingCode = '';
  }

  void getSpaceBfwByType(String type) async {
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    _isFetch = true;
    _loading = true;
    notifyListeners();
    final response =
        await _issueServiceRepository.getSpaceBfwByType(type, userToken);

    if (type == 'BUILDING') {
      response.fold(
          (l) => {
                _buildingFilterValues.addAll(l),
                for (int i = 0; i < _buildingFilterValues.length; i++)
                  {
                    _buildingFilterNames
                        .add(_buildingFilterValues[i].name.toString()),
                  },
                _loading = false,
              },
          (r) => {
                _loading = false,
              });
    }
    if (type == 'FLOOR') {
      response.fold(
          (l) => {
                _floorFilterValues.addAll(l),
                for (int i = 0; i < _floorFilterValues.length; i++)
                  {
                    _floorFilterNames
                        .add(_floorFilterValues[i].name.toString()),
                  },
                _loading = false,
              },
          (r) => {
                _loading = false,
              });
    }
    if (type == 'WING') {
      response.fold(
          (l) => {
                _wingFilterValues.addAll(l),
                for (int i = 0; i < _wingFilterValues.length; i++)
                  {
                    _wingFilterNames.add(_wingFilterValues[i].name.toString()),
                  },
                _loading = false,
              },
          (r) => {
                _loading = false,
              });
    }

    notifyListeners();
  }

  void getIssueOpenStatusCodes() async {
    String userToken = await SharedManager().getString(SharedEnum.deviceId);
    _isFetch = true;
    _loading = true;
    notifyListeners();
    final response =
        await _issueServiceRepository.getIssueOpenStatusCodes(userToken);
    response.fold(
        (l) => {
              _issueStatusCodes.addAll(l),
              for (int i = 0; i < _issueStatusCodes.length; i++)
                {
                  _issueStatusNames.add(_issueStatusCodes[i].name.toString()),
                },
              _loading = false,
            },
        (r) => {
              _loading = false,
            });

    notifyListeners();
  }
}
