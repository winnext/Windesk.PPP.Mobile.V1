import 'package:flutter/material.dart';

import '../../../../feature/models/issue_models/issue_list_model.dart';
import '../../../../feature/models/issue_models/issue_tracing_list_model.dart';
import '../service/issue_service_repo_impl.dart';

class IssueProvider extends ChangeNotifier {
  final IssueServiceRepoImpml _issueServiceRepository = IssueServiceRepoImpml();

  bool _loading = false;
  bool get loading => _loading;

  bool _isFetch = false;
  bool get isFetch => _isFetch;

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

  int _currentPage = 1;
  int get currentPage => _currentPage;
  set setcurrentPage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  List<IssueTracingListModel> _tracingList = [];
  List<IssueTracingListModel> get tracingList => _tracingList;

  List<IssueListModel> _issueList = [];
  List<IssueListModel> get issueList => _issueList;

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
    notifyListeners();
    final response = await _issueServiceRepository.getIssueList(queryParameters, issueListType);
    response.fold(
        (l) => {
              _issueList = l,
              _loading = false,
              notifyListeners(),
            },
        (r) => {
              _loading = false,
              notifyListeners(),
            });
  }
}
