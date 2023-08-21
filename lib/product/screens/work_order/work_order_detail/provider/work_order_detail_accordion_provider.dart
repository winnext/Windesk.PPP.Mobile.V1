import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/feature/injection.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_loads_model.dart';
import 'package:wm_ppp_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderDetailAccordionProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl _service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  bool userClickedEfforts = false;
  bool userFetchedEfforts = false;

  bool userCLickedPersonals = false;
  bool userFetchedPersonals = false;

  bool isLoading = false;

  List<WorkOrderLoadsModel> loads = [];

  void update() {
    notifyListeners();
  }

  void setUserClickedEfforts() {
    userClickedEfforts = true;
  }

  void setUserClickedPersonals() async {
    userCLickedPersonals = true;
  }

  void fetchEffortList(String workOrderCode) async {
    if (!userFetchedEfforts) {
      isLoading = true;
      String userId = await SharedManager().getString(SharedEnum.userName);
      final response = await _service.getWorkOrderLoads(userId, workOrderCode);
      response.fold(
        (l) => {
          loads = l,
        },
        (r) => {
          loads = [],
        },
      );
      isLoading = false;
      userFetchedEfforts = true;
      notifyListeners();
    }
  }
}
