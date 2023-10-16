import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/product/screens/work_order/work_order_detail/view/work_order_detail_screen.dart';

import '../../../service/search_service_repo_impl.dart';

class WoSearchProvider extends ChangeNotifier {
  final SearchServiceRepoImpml _searchServiceRepository =
      SearchServiceRepoImpml();

  String _searchWoCode = '';
  String get searchWoCode => _searchWoCode;
  set setSearchWoCode(String searchWoCode) {
    _searchWoCode = searchWoCode;
    notifyListeners();
  }

  printSearchData(context) async {
    final response = await _searchServiceRepository
        .checkWorkorderByAuthorizedServices(searchWoCode);
    // ignore: avoid_print
    response.fold(
        (l) => {
              if (l > 0)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WorkOrderDetailScreen(workorderCode: searchWoCode)),
                  )
                }
              else
                {
                  snackBar(
                      context,
                      "Girdiğiniz iş emri numarası hatalı veya iş emrini görmeye yetkiniz yoktur.",
                      'error')
                }
            },
        // ignore: avoid_print
        (r) => {print('error')});
  }
}
