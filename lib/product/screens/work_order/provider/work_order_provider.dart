import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/models/work_order_models/work_order_tracing_list_model.dart';

import '../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();

  bool _initialState = true;

  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<WorkOrderTracingListModel> workOrderTracingListModel = [];

  void update() {
    notifyListeners();
  }

  void getWorkOrderList() async {
    if (_initialState) {
      _initialState = false;
      _changeLoading();
      notifyListeners();

      final String userName = await SharedManager().getString(SharedEnum.userCode);

      print('username' + userName);
      await workSpaceService.getWorkOrderTracingList(userName).then((value) {
        value.fold(
          (l) => {
            workOrderTracingListModel = l,
          },
          (r) => {},
        );
      });
      _changeLoading();
    }

    notifyListeners();
  }

  void _changeLoading() {
    _isLoading = !_isLoading;
  }
}
