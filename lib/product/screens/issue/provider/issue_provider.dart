import 'package:flutter/material.dart';
import '../../../../feature/models/issue_models/issue_tracing_list_model.dart';
import '../service/issue_service_repo_impl.dart';

import '../service/issue_service_repo.dart';

class IssueProvider extends ChangeNotifier {
  final IssueServiceRepository _issueServiceRepository =
      IssueServiceRepoImpml();

  bool _loading = false;
  bool get loading => _loading;

  final List<IssueTracingListModel> _tracingList = [];
  List<IssueTracingListModel> get tracingList => _tracingList;

  void getTracingList() async {
    _loading = true;
    final response = await _issueServiceRepository.getIssueTracingList();

    response.fold(
        (l) => {
              _loading = false,
            },
        (r) => {});
  }
}
