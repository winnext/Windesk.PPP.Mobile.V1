import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_details_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderDetailMainProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();

  bool initState = true;
  bool errorActive = false;
  WorkOrderDetailsModel workOrderDetailsModel = const WorkOrderDetailsModel();

  void getWorkOrderDetail(String workOrderCode) async {
    if (initState) {
      initState = false;
      String userCode = await SharedManager().getString(SharedEnum.userCode);
      final response = await _service.getWorkOrderDetails(userCode, workOrderCode);

      response.fold(
        (l) => {
          workOrderDetailsModel = l,
        },
        (r) => {
          errorActive = true,
        },
      );
      notifyListeners();
    }
  }
}
