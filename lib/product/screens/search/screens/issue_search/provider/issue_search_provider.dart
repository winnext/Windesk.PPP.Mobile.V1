import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/product/screens/issue/view/issue_detail_screen.dart';

import '../../../service/search_service_repo_impl.dart';

class IssueSearchProvider extends ChangeNotifier {
  final SearchServiceRepoImpml _searchServiceRepository =
      SearchServiceRepoImpml();

  String _searchIssueCode = '';
  String get searchIssueCode => _searchIssueCode;
  set setSearchIssueCode(String searchIssueCode) {
    _searchIssueCode = searchIssueCode;
    notifyListeners();
  }



  bool _issueUpdateData = false;
  bool get issueUpdateData => _issueUpdateData;
  set setIssueUpdateData(bool issueUpdateData) {
    _issueUpdateData = issueUpdateData;
    notifyListeners();
  }

  printSearchData(context) async {
    final response =
        await _searchServiceRepository.checkIssueByAuth(searchIssueCode);
    // ignore: avoid_print
    var result;
    response.fold(
        (l) => {
              if (l > 0)
                {
                  setIssueUpdateData = true,

                  // Navigator.of(context).popAndPushNamed(
                  //   'IssueDetailScreen',
                  // )
                }
              else
                {
                  snackBar(
                      context,
                      "Girdiğiniz vaka numarası hatalı veya vakayı görmeye yetkiniz yoktur.",
                      'error')
                }
            },
        // ignore: avoid_print
        (r) => {print('error')});
  }
}
