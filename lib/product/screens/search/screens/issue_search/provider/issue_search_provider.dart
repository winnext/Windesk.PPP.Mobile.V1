import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/product/screens/issue/provider/issue_provider.dart';
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

  bool _dataUpdate = false;
  bool get dataUpdate => _dataUpdate;
  set setDataUpdate(bool dataUpdate) {
    _dataUpdate = dataUpdate;
    notifyListeners();
  }

  printSearchData(context) async {
    final response =
        await _searchServiceRepository.checkIssueByAuth(searchIssueCode);
    // ignore: avoid_print
    IssueProvider issueProvider = IssueProvider();

    response.fold(
        (l) => {
              if (l > 0)
                {
                  // context.router.popAndPush(
                  //     IssueDetailScreen(issueCode: searchIssueCode)),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IssueDetailScreen(
                              issueCode: searchIssueCode,
                            )),
                  )

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
