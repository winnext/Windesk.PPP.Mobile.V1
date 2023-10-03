import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/models/issue_action_models/issue_operation_list_model.dart';
import 'package:wm_ppp_4/product/screens/issue/service/issue_service_repo_impl.dart';

class IssueActionProvider extends ChangeNotifier {
  final IssueServiceRepoImpml _issueServiceRepository = IssueServiceRepoImpml();

  bool _isFetch = false;
  bool get isFetch => _isFetch;

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

  IssueOperationList _issueOperationList = const IssueOperationList();
  IssueOperationList get issueOperationList => _issueOperationList;

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
}
