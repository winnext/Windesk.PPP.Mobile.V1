import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/models/work_order_models/work_order_tracing_list_model.dart';

import '../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();

  bool _initialState = true;

  List<WorkOrderTracingListModel> workOrderTracingListModel = [];

  void getWorkOrderList() async {
    final String userName = await SharedManager().getString(SharedEnum.userName);
    if (_initialState) {
      _initialState = false;
      workSpaceService.getWorkOrderTracingList(userName).then((value) {
        value.fold((l) => {workOrderTracingListModel = l}, (r) => {});
        notifyListeners();
      });
      notifyListeners();
    }
  }
}
