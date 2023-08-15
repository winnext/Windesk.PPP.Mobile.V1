import 'package:flutter/material.dart';

import '../../../service/search_service_repo_impl.dart';

class IssueSearchProvider extends ChangeNotifier {
  final SearchServiceRepoImpml _searchServiceRepository = SearchServiceRepoImpml();

  String _searchIssueCode = '';
  String get searchIssueCode => _searchIssueCode;
  set setSearchIssueCode(String searchIssueCode) {
    _searchIssueCode = searchIssueCode;
    notifyListeners();
  }

  void printSearchData() async {
    final response = await _searchServiceRepository.checkIssueByAuth(searchIssueCode);
    response.fold((l) => {}, (r) => {});
  }
}
