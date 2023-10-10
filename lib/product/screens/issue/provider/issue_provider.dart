// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_activities_model.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_attachments_model.dart';
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
  set setisFetch(bool isFetch) {
    _isFetch = isFetch;
    notifyListeners();
  }

  bool _isFetchSummary = false;
  bool get isFetchSummary => _isFetchSummary;

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
  set setstatusName(String statusName) {
    _statusName = statusName;
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
  set setbuildName(String buildName) {
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
  set setfloorName(String floorName) {
    _floorName = floorName;
    notifyListeners();
  }

  String _floorCode = '';
  String get floorCode => _floorCode;
  set setfloorCode(String floorCode) {
    _floorCode = floorCode;
    notifyListeners();
  }

  String _wingCode = '';
  String get wingCode => _wingCode;
  set setwingCode(String wingCode) {
    _wingCode = wingCode;
    notifyListeners();
  }

  String _wingName = '';
  String get wingName => _wingName;
  set setwingName(String wingName) {
    _wingName = wingName;
    notifyListeners();
  }

  String _assigne = '';
  String get assigne => _assigne;
  set setassigne(String assigne) {
    _assigne = assigne;
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

  bool notificationController(ScrollNotification scrollInfo) {
    if (!loading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
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
    final response = await _issueServiceRepository.getIssueList(queryParameters, issueListType);
    response.fold(
        (l) => {
              _issueList.addAll(l),
              _loading = false,
              l.length % 10 == 0 ? null : _totalRecordCount = true,
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

  void getIssueTimeInfo(String issuecode) async {
    _isFetchSummary = true;
    _loading = true;
    notifyListeners();
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
    final response = await _issueServiceRepository.getIssueActivities(issuecode);
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
    final response = await _issueServiceRepository.getIssueAttachment(issuecode);

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
}
