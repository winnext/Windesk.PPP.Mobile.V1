import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/product/screens/issue/view/issue_detail_screen.dart';

import '../../../service/search_service_repo_impl.dart';

class IssueSearchProvider extends ChangeNotifier {
  final SearchServiceRepoImpml _searchServiceRepository = SearchServiceRepoImpml();

  String _searchIssueCode = '';
  String get searchIssueCode => _searchIssueCode;
  set setSearchIssueCode(String searchIssueCode) {
    _searchIssueCode = searchIssueCode;
    notifyListeners();
  }

  printSearchData(context) async {
    final response = await _searchServiceRepository.checkIssueByAuth(searchIssueCode);
    // ignore: avoid_print
    response.fold(
        (l) => {
              if (l > 0)
                {
                  context.router.push(IssueDetailScreen(issueCode: searchIssueCode)),
                }
              else
                {snackBar(context, "Girdiğiniz vaka numarası hatalı veya vakayı görmeye yetkiniz yoktur.", 'error')}
            },
        (r) => {});
  }
}
